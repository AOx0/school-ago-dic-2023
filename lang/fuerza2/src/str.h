#ifndef ASTRS
#define ASTRS

#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#ifdef __cplusplus
extern "C"{
#endif 

struct str_slice {
        char *ptr;
        size_t len;
};

struct str_iterator {
        struct str_slice *sl;
        char *sep;
        char ended;
};

struct str_slice str_slice_new_cstr(char *c, size_t len);

void str_slice_self(struct str_slice *sl, size_t start, size_t end);

void str_slice_debug_verbose(struct str_slice *s);

void str_slice_debug(struct str_slice *s);

struct str_slice str_slice_slice(struct str_slice *sl, size_t start,
                                 size_t end);
struct str_slice str_slice_slice_end(struct str_slice *sl, size_t start);
struct str_iterator str_slice_iter(struct str_slice *sl, char *sep);
struct str_slice str_iter_next(struct str_iterator *it);


#ifdef __cplusplus
}
#endif

#endif // ASTRS
