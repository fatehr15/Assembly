import subprocess

def disassemble_object(file_path):
    """Disassemble object file using objdump"""
    cmd = f"objdump -d {file_path}"
    result = subprocess.run(cmd.split(), capture_output=True, text=True)
    print(result.stdout)

def trace_function(function_name, executable):
    """Trace function calls using gdb"""
    gdb_cmds = [
        f"file {executable}",
        f"b {function_name}",
        "commands",
        "bt",
        "c",
        "end",
        "run"
    ]
    subprocess.run(["gdb", "-batch", "-ex", "; ".join(gdb_cmds)])
