# Kirby Air Ride

This repo contains a WIP decompilation of Kirby Air Ride (US/Kor).

It builds the following DOL:

main.dol: `sha1: 977533bb96e6a16e127946396489be1b4164ac42`

## Building

### Required packages

* [devkitPro](https://devkitpro.org/wiki/Getting_Started)
* python3
* gcc

### Instructions

1. Download the Gamecube SDK and make an environment variable called SDK_BASE_PATH that points to this folder such that the folder root has both the HW2 and include folders.
2. Download the Codewarrior for Gamecube (preferrably 2.7 since it can be found in full) and install it and make CW_BASE_PATH point to this folder where it is installed.
3. Obtain a clean DOL of KAR US/Kor and place it in the base working directory and name it `baserom.dol`.
4. Download GC_WII_COMPILERS.zip from (https://cdn.discordapp.com/attachments/704241951972524063/801641758249320478/GC_WII_COMPILERS.zip) and extract it to tools/mwcc_compiler/.
5. Run the `make` command

## Contributions

Contributions and PRs are welcome.

## TODO

Make a TODO list
