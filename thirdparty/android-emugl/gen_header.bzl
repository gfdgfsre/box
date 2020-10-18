"""Rules that execute shell commands to do simple transformations.
While shell commands are convenient, they should be used carefully. Shell
commands are subject to escaping and injection issues, as well as portability
problems. It is often better to declare a binary target in a BUILD file and
execute it.
For very simple commands that are only used for a small number of targets, it
may be simpler to use genrule()s in a BUILD file instead of a custom rule that
invokes shell commands.
"""

def _emit_size_impl(ctx):
    # The input file is given to us from the BUILD file via an attribute.
    in_file = ctx.file.file

    # The output file is declared with a name based on the target's name.
    out_file = ctx.actions.declare_file("%s.size" % ctx.attr.name)

    ctx.actions.run_shell(
        # Input files visible to the action.
        inputs = [in_file],
        # Output files that must be created by the action.
        outputs = [out_file],
        # The progress message uses `short_path` (the workspace-relative path)
        # since that's most meaningful to the user. It omits details from the
        # full path that would help distinguish whether the file is a source
        # file or generated, and (if generated) what configuration it is built
        # for.
        progress_message = "Getting size of %s" % in_file.short_path,
        # The command to run. Alternatively we could use '$1', '$2', etc., and
        # pass the values for their expansion to `run_shell`'s `arguments`
        # param (see convert_to_uppercase below). This would be more robust
        # against escaping issues. Note that actions require the full `path`,
        # not the ambiguous truncated `short_path`.
        command = "wc -c '%s' | awk '{print $1}' > '%s'" %
                  (in_file.path, out_file.path),
    )

    # Tell Bazel that the files to build for this target includes
    # `out_file`.
    return [DefaultInfo(files = depset([out_file]))]

emit_size = rule(
    implementation = _emit_size_impl,
    attrs = {
        "file": attr.label(
            mandatory = True,
            allow_single_file = True,
            doc = "The file whose size is computed",
        ),
    },
    doc = """
Given an input file, creates an output file with the extension `.size`
containing the file's size in bytes.
""",
)

def _gen_headers_impl(ctx):
    # Both the input and output files are specified by the BUILD file.
    in_file = ctx.file.input
    out_file = ctx.outputs.output
    script_file = ctx.file.script
    ctx.actions.run_shell(
        outputs = [out_file],
        inputs = [in_file],
        script_file = [script_file],
        arguments = [script_file.path, in_file.path, out_file.path],
        command = "$1 $2 $3",
    )
    # No need to return anything telling Bazel to build `out_file` when
    # building this target -- It's implied because the output is declared
    # as an attribute rather than with `declare_file()`.

gen_headers = rule(
    implementation = _gen_headers_impl,
    attrs = {
        "input": attr.label(
            allow_single_file = True,
            mandatory = True,
            doc = "The file to transform",
        ),
        "script": attr.label(
            allow_single_file = True,
            mandatory = True,
            doc = "The generate scripts"
        ),
        "output": attr.output(doc = "The generated file"),
    },
    doc = "Transforms a text file by changing its characters to uppercase.",
)


"""Execute a binary.
The example below executes the binary target "//actions_run:merge" with
some arguments. The binary will be automatically built by Bazel.
The rule must declare its dependencies. To do that, we pass the target to
the attribute "_merge_tool". Since it starts with an underscore, it is private
and users cannot redefine it.
"""

def _impl(ctx):
    # The list of arguments we pass to the script.
    args = [ctx.outputs.out.path] + [f.path for f in ctx.files.chunks]

    # Action to call the script.
    ctx.actions.run(
        inputs = ctx.files.input,
        outputs = [ctx.outputs.out],
        arguments = args,
        progress_message = "Merging into %s" % ctx.outputs.out.short_path,
        executable = ctx.executable.emugen_tool,
    )

emugen_tool = rule(
    implementation = _impl,
    attrs = {
        "input": attr.label_list(allow_files = True),
        "out": attr.output(mandatory = True),
        "emugen_tool": attr.label(
            executable = True,
            cfg = "exec",
            allow_files = True,
            default = Label("//thirdparty/android-emugl:emugen"),
        ),
    },
)
