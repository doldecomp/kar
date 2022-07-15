#include <sysdolphin/archive.h>

extern char lbl_805046C0[];

inline void Locate(HSD_Archive* archive)
{
    int i;
    u32* ptr;

    for (i = 0; i < archive->header.nb_reloc; i++) {
        ptr = (u32*)(archive->data + archive->reloc_info[i].offset);
        *ptr += (u32)archive->data;
    }
}

s32 HSD_ArchiveParse(HSD_Archive* archive, u8* src, u32 file_size)
{
    u32 offset;

    if (archive == NULL) {
        return -1; 
    }

    memset(archive, 0, sizeof(HSD_Archive));
    archive->flags |= 1;
    memcpy(archive, src, sizeof(HSD_ArchiveHeader));

    if (archive->header.file_size != file_size) {
        _OSReport(lbl_805046C0);
        return -1;
    }

    offset = sizeof(HSD_ArchiveHeader);
    if (archive->header.data_size != 0) { // Body Size
        archive->data = src + 0x20;
        offset = archive->header.data_size + 0x20;
    }
    if (archive->header.nb_reloc != 0) { // Relocation Size
        archive->reloc_info = (HSD_ArchiveRelocationInfo*)((s32)src + offset);
        offset = offset + archive->header.nb_reloc * 4;
    }
    if (archive->header.nb_public != 0) { // Root Size
        archive->public_info = (HSD_ArchivePublicInfo*)((s32)src + offset);
        offset = offset + archive->header.nb_public * 8;
    }
    if (archive->header.nb_extern != 0) { // XRef Size
        archive->extern_info = (HSD_ArchiveExternInfo*)((s32)src + offset);
        offset = offset + archive->header.nb_extern * 8;
    }
    if (offset < archive->header.file_size) { // File Size
        archive->symbols = (char*)((s32)src + offset);
    }

    archive->top_ptr = (void*)src;
    Locate(archive);

    return 0;
}
