# 🧠 **Assembly Function Library**

> A lightweight **x86-64 assembly** library offering utility functions for numbers, strings, and arrays with a C-callable interface.

---
# 📚 **Table of Contents**

**1.** [📖 Project Overview](#project-overview)

**2.** [📁 Directory Structure](#directory-structure)

**3.** [⚙️ Prerequisites](#prerequisites)

**4.** [🛠 Building](#building)

**5.** [🚀 Usage](#usage)

**6.** [🧩 API Reference](#api-reference)

  **6.1** [🔢 Number Operations](#number-operations)
  
  **6.2** [🔤 String Operations](#string-operations)
  
  **6.3** [📊 Array Operations](#array-operations)

  
**7.** [✅ Testing](#testing)

**8.** [🐞 Debugging Guide](#debugging-guide)

**9.** [🔧 Tools](#tools)

**10.** [🤝 Contributing](#contributing)

**11.** [📄 License](#license)



---

# 📖 **Project Overview**

This project implements a collection of utility routines in **`x86-64 assembly`**, exposing a **`C-callable interface`** for:

* 🔢 Digit summation & factorial computation
* ✔️ Even number checking
* 📏 String length & emptiness checking
* 🔄 Array printing, reversing & sorting

➡️ These routines are wrapped via `c_wrapper.c` and demoed in `main.c`.

---

# 📁 **Directory Structure**

```plaintext
project/
├── src/
│   ├── assembly_library.asm   # 🧠 Assembly code
│   ├── c_wrapper.c            # 🔗 C interface
│   └── main.c                 # 🚀 Entry point
├── include/
│   └── assembly_library.h     # 📄 API header
├── build/
│   ├── assembly_library.o     # 🧱 ASM object
│   ├── c_wrapper.o            # ⚙️ C object
│   └── asm_test               # ✅ Executable
├── tests/
│   ├── unit_tests.c           # 🔍 Unit tests
│   └── benchmark.c            # ⏱ Benchmarking
├── tools/
│   ├── debug_helpers.py       # 🐞 GDB helpers
│   ├── reg_tracker.py         # 📈 Register tracker
│   └── mem_access.py          # 🧠 Mem visualizer
├── docs/
│   ├── assembly_docs.md       # 📘 ASM docs
│   └── debugging_guide.md     # 🛠 Debug tips
└── Makefile                   # 🔧 Build logic
```

---

# ⚙️ **Prerequisites**

✅ Make sure the following tools are installed:

* 🧰 `GCC` (>= 7.0)
* 🧵 `NASM` (>= 2.13)
* 🧪 `Criterion` (for testing)
* 🐍 `Python 3.x` (for utilities)

---

# 🛠 **Building**

```bash
# 🔨 Build everything
make all

# 🧹 Clean build artifacts
make clean
```

**🔖 Makefile Targets:**

* `all` → Build all components
* `clean` → Remove build directory

---

# 🚀 **Usage**

```bash
cd build
./asm_test
```

💡 This runs a demonstration using all implemented functions.

---

# 🧩 **API Reference**

## 🔢 **Number Operations**

| 🧩 Function   | 💡 Prototype                | 📘 Description            |
| ------------- | --------------------------- | ------------------------- |
| `sumOfDigits` | `int sumOfDigits(int num);` | 🔢 Sum of digits in `num` |
| `factorial`   | `long factorial(int num);`  | 📈 Compute `num!`         |
| `isEven`      | `bool isEven(int num);`     | ✔️ True if number is even |

## 🔤 **String Operations**

| 🧩 Function    | 💡 Prototype                         | 📘 Description                      |
| -------------- | ------------------------------------ | ----------------------------------- |
| `stringLength` | `int stringLength(const char* str);` | 📏 Length of null-terminated string |
| `isEmpty`      | `bool isEmpty(const char* str);`     | ⚠️ True if string is empty          |

## 📊 **Array Operations**

| 🧩 Function    | 💡 Prototype                              | 📘 Description                 |
| -------------- | ----------------------------------------- | ------------------------------ |
| `printArray`   | `void printArray(int arr[], int size);`   | 🖨️ Print elements to `stdout` |
| `reverseArray` | `void reverseArray(int arr[], int size);` | 🔄 Reverse array in place      |
| `bubbleSort`   | `void bubbleSort(int arr[], int size);`   | 🔃 Sort using Bubble Sort      |

---

# ✅ **Testing**

🧪 Run unit tests using **Criterion**:

```bash
# 🧪 Build tests
gcc -Wall -Wextra -Iinclude -o build/unit_tests tests/unit_tests.c build/assembly_library.o build/c_wrapper.o -lcriterion

# 🚀 Run tests
./build/unit_tests
```

**📊 See [🧪 Benchmarking](#benchmarking) for performance analysis.**

---

# 🐞 **Debugging Guide**

📖 For a full guide, see `docs/debugging_guide.md`

## 🛠 **GDB Cheat Sheet**

```bash
gdb build/asm_test
(gdb) info registers     # 📋 Show all register values
(gdb) stepi              # 🐾 Step one instruction
(gdb) x/10xw $rsp        # 🔍 Inspect stack
```

## ❌ **Common Segfault Causes**

* 🧱 Invalid memory access
* 🌀 Stack misalignment
* 💣 Null pointer dereference

---

# 🔧 **Tools**

| 🧰 Tool            | 🧩 Description                             |
| ------------------ | ------------------------------------------ |
| `reg_tracker.py`   | 📈 Real-time register tracker + CSV export |
| `mem_access.py`    | 🧠 Memory access log parser and visualizer |
| `debug_helpers.py` | 🐞 GDB macros and helpers                  |

---

# 🤝 **Contributing**

👋 Contributions are welcome! Open issues or submit a PR for improvements.

---

# 📄 **License**

📝 This project is for  academic purposes !
