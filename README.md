
# ascii-smiley-asm

A tiny assembly program (NASM) that prints a ASCII-art smiley face on **macOS**.  
Yes, you can still do low-level system calls on modern Macs—here’s a fun example!

## Prerequisites

- **macOS** (Intel or Apple Silicon [via Rosetta])
- **NASM** installed (`brew install nasm`)

## Usage

1. **Clone this repo**:
   ```bash
   git clone https://github.com/YourGitHubUsername/ascii-smiley-asm.git
   cd ascii-smiley-asm
   ```

2. **Assemble & Link**:
   ```bash
   # Assemble:
   nasm -f macho64 smiley.asm -o smiley.o

   # Link:
   ld -macosx_version_min 10.13 -lSystem -no_pie smiley.o -o smiley
   ```

3. **Run**:
   ```bash
   ./smiley
   ```
   You should see a glorious ASCII smiley in your terminal.

## Example Output

```
   .-''''-.   
  /        \  
 (  O    O  ) 
 |          | 
 | .-------. | 
 | |       | | 
 | '-------' | 
  \        /  
   '-....-'   
```

## How It Works

- **NASM** compiles `smiley.asm` into a Mach-O **object file**.
- **ld** links it, producing a **native** macOS executable.
- We use **syscalls** (`sys_write`, `sys_exit`) to print and exit.
- This is purely minimal: no runtime, no libc—just a direct system call interface.

## Troubleshooting

- If you’re on **Apple Silicon**, install **Rosetta 2** if you haven’t already:
  ```bash
  softwareupdate --install-rosetta
  ```
  Then run the same steps. Alternatively, you can adapt the code for ARM syscalls, but currently this example uses x86-64 calls.






---

## Building & Running

1. **Install NASM**:
   ```bash
   brew install nasm
   ```
2. **Assemble & Link**:
   ```bash
   nasm -f macho64 smiley.asm -o smiley.o
   ld -macosx_version_min 10.13 -lSystem -no_pie smiley.o -o smiley
   ```
3. **Run**:
   ```bash
   ./smiley
   ```