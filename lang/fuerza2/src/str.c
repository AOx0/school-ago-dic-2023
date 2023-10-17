#include "str.h"
#include <stdio.h>
#include <string.h>

#define BUFF_SIZE 2

struct str_slice str_slice_new_cstr(char *c, size_t len) {
    struct str_slice res;

    res.ptr = c;
    res.len = len;

    return res;
}

void str_slice_self(struct str_slice *sl, size_t start, size_t end) {
    if (start > end) {
        printf("Panic: Index is %zu but end is %zu\n", start, end);
        exit(1);
    } else if (end > sl->len) {
        printf("Panic: Index is %zu but len is %zu\n", end, sl->len);
        exit(1);
    }

    sl->ptr = &sl->ptr[start];
    sl->len = end - start;
}

struct str_slice str_slice_slice(struct str_slice *sl, size_t start,
                                 size_t end) {
    if (start > end) {
        printf("Panic: Index is %zu but end is %zu\n", start, end);
        exit(1);
    } else if (end > sl->len) {
        printf("Panic: Index is %zu but len is %zu\n", end, sl->len);
        exit(1);
    }

    struct str_slice res;

    res.ptr = &sl->ptr[start];
    res.len = end - start;

    return res;
}

struct str_slice str_slice_slice_end(struct str_slice *sl, size_t start) {
    if (start > sl->len) {
        printf("Panic: Index is %zu but len is %zu", start, sl->len);
        exit(1);
    }

    struct str_slice res = str_slice_slice(sl, start, sl->len);
    return res;
}

void str_slice_debug_verbose(struct str_slice *s) {
    printf("struct string { ptr: %p, len: %zu, val: ", (void *)s->ptr,
           s->len);

    for (size_t i = 0; i < s->len; i++) {
        printf("%.2X ", s->ptr[i]);
    }

    printf("}\n");
}

void str_slice_debug(struct str_slice *s) {
    printf("struct string { ptr: %p, len: %zu }\n", (void *)s->ptr,
           s->len);
}

struct str_iterator str_slice_iter(struct str_slice *sl, char *sep) {
    struct str_iterator res;
    res.sl = sl;
    res.ended = 0;
    res.sep = sep;

    return res;
}

struct str_slice str_iter_next(struct str_iterator *it) {
    struct str_slice res;
    size_t sep_len = strlen(it->sep);

    size_t idx = 0;

    while (idx < it->sl->len && it->sl->len > sep_len && !it->ended) {

        if (strncmp(&it->sl->ptr[idx], it->sep, sep_len) == 0) {
            res = str_slice_slice(it->sl, 0, idx);
            str_slice_self(it->sl, idx + sep_len, it->sl->len);
            return res;
        }

        idx += 1;
    }

    if (!it->ended) {
        res = str_slice_slice_end(it->sl, 0);
        it->ended = 1;
        return res;
    }

    puts("Panic: Empty iterator");
    exit(1);
}
