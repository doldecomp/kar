
# Kirby Air Ride [![Discord Badge]][Discord]

*A* ***WIP*** *decompilation of the* ***US*** / ***Korean*** *version.*

<br>

---

## DOL

*The* ***DOL*** *built with this repository.*

**File** : `main.dol` <br>
**SHA1** : `977533bb96e6a16e127946396489be1b4164ac42`

---


<br>

## Building

### Requirements

- **[DevKitPro]**

- **[Python3]**

    ```sh
    pacman -S msys/python3
    ```

- **[GCC]**

    ```sh
    pacman -S gcc
    ```

<br>

### Instructions

1. Download the **Gamecube SDK**.

2. Create an **Environment Variable** called  <br>
   `SDK_BASE_PATH` pointing to its root folder.

   *The root folder should contain* <br>
   *the `HW2` & `include` folders.*

3. Install **Codewarrior** for the Gamecube.

    *Preferrably use `v2.7` as it can be found in full.*

4. Create an **Environment Variable** called <br>
   `CW_BASE_PATH` pointing to the installation folder.

5. Obtain a clean **DOL** of **KAR** **US** / **Korean**.

6. Place it in the root folder with `baserom.dol` as its name.

7. Download <kbd>**[GC_WII_COMPILERS.zip][GC]**</kbd>

8. Extract it's content to `/tools/mwcc_compiler/`.

9. Run the **Make** command :

    ```sh
    make
    ```

<br>

---

<br>

## Contributions

*`Contributions` / `Pull Requests` are welcome !*


<!----------------------------------------------------------------------------->

[DevKitPro]: https://devkitpro.org/wiki/Getting_Started
[Python3]: https://www.python.org/
[GCC]: https://gcc.gnu.org/
[GC]: https://cdn.discordapp.com/attachments/727918646525165659/917185027656286218/GC_WII_COMPILERS.zip

[Discord Badge]: https://img.shields.io/badge/Discord-7289DA?style=for-the-badge&logo=discord&logoColor=white
[Discord]: https://discord.gg/hKx3FJJgrV
