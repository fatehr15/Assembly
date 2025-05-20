import re

def parse_registers(gdb_output):
    """Parse GDB register output"""
    regs = {}
    pattern = r"\$(\w+)\s+=\s+(0x[0-9a-f]+)"
    matches = re.findall(pattern, gdb_output)
    for reg, value in matches:
        regs[reg] = int(value, 16)
    return regs

def track_registers(executable):
    """Track register changes during execution"""
    cmd = [
        "gdb", "-batch", executable,
        "-ex", "set logging on",
        "-ex", "start",
        "-ex", "while 1\nstepi\ninfo registers\nend"
    ]
    subprocess.run(cmd)
