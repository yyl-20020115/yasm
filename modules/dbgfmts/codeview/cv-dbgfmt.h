/*
 * CodeView debugging formats implementation for Yasm
 *
 *  Copyright (C) 2006-2007  Peter Johnson
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND OTHER CONTRIBUTORS ``AS IS''
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR OTHER CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */
#ifndef YASM_CV_DBGFMT_H
#define YASM_CV_DBGFMT_H

typedef struct {
    char *pathname;             /* full pathname (drive+basepath+filename) */
    char *filename;             /* filename as yasm knows it internally */
    unsigned long str_off;      /* offset into pathname string table */
    unsigned long info_off;     /* offset into source info table */
    unsigned char digest[16];   /* MD5 digest of source file */
} cv_filename;

/* Global data */
typedef struct yasm_dbgfmt_cv {
    yasm_dbgfmt_base dbgfmt;        /* base structure */

    cv_filename *filenames;
    size_t filenames_size;
    size_t filenames_allocated;

    int version;
} yasm_dbgfmt_cv;


/* Note: each line number group is associated with a file AND a section */
typedef struct cv8_linepair {
    unsigned long offset;
    unsigned long line;
} cv8_linepair;

/* Decrease linked list overhead a bit doing it this way */
typedef struct cv8_lineset {
    STAILQ_ENTRY(cv8_lineset) link;
    cv8_linepair pairs[126];
    size_t num_pairs;
} cv8_lineset;



/* Note: Due to line number sorting requirements (by section offset it seems)
 *       one file may need more than one record per section. */
typedef struct cv8_lineinfo {
    STAILQ_ENTRY(cv8_lineinfo) link;
    const cv_filename* fn;      /* filename associated with line numbers */
    yasm_section* sect;         /* section line numbers are for */
    yasm_symrec* sectsym;       /* symbol for beginning of sect */
    unsigned long num_linenums;
    int first_in_sect;          /* First lineinfo for this section. */
    STAILQ_HEAD(cv8_lineset_head, cv8_lineset) linesets;
} cv8_lineinfo;

typedef struct cv_line_info {
    yasm_section* debug_symline;
    yasm_object* object;
    yasm_dbgfmt_cv* dbgfmt_cv;
    yasm_linemap* linemap;
    yasm_errwarns* errwarns;
    unsigned int num_lineinfos;
    STAILQ_HEAD(cv8_lineinfo_head, cv8_lineinfo) cv8_lineinfos;
    /*@null@*/ cv8_lineinfo* cv8_cur_li;
    /*@null@*/ cv8_lineset* cv8_cur_ls;
} cv_line_info;

yasm_bytecode *yasm_cv__append_bc(yasm_section *sect, yasm_bytecode *bc);

/* Symbol/Line number functions */
yasm_section *yasm_cv__generate_symline
    (yasm_object *object, yasm_linemap *linemap, yasm_errwarns *errwarns, cv_line_info* info);

/* Type functions */
yasm_section *yasm_cv__generate_type(yasm_object *object);

#endif
