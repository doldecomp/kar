
# Building

*How to compile this project from source.*

<br>

## Requirements
 
*Things you need to install in beforehand.*

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
<br>

## Instructions

*Steps that need to be executed in order.*

<br>

1.  Download the **[GameCube SDK]**.

    <br>

2.  Create an **Environment Variable**:

    `SDK_BASE_PATH`  🠒  ***SDK Root Folder***

    *The root folder should contain* <br>
    *the  `HW2`  &  `include`  folders.*

    <br>

3.  Install **Codewarrior** for the **Gamecube**.

    *Preferably use  `v2.7`  as it can be found in full.*

    <br>

4.  Create an **Environment Variable**:

    `CW_BASE_PATH`  🠒  ***Codewarrior Installation Folder***
    
    <br>

5.  Obtain a clean **DOL** of **KAR**

    *Either the **US** or **Korean** version.*

    <br>

6.  Place it in the root folder with <br>
    `baserom.dol`  as its name.

    <br>

7.  Download <kbd>**[GC_WII_COMPILERS.zip][GC]**</kbd>

    <br>

8.  Extract it to  `/tools/mwcc_compiler/` .

    <br>

9.  Run the **Make** command :

    ```sh
    make
    ```

<br>


<!----------------------------------------------------------------------------->

[GameCube SDK]: https://archive.org/details/GameCubeSDK
[DevKitPro]: https://devkitpro.org/wiki/Getting_Started
[Python3]: https://www.python.org/
[GCC]: https://gcc.gnu.org/
[GC]: https://cdn.discordapp.com/attachments/727918646525165659/917185027656286218/GC_WII_COMPILERS.zip
