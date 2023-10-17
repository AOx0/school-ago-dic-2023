#include <filesystem>
#include <fstream>
#include <iostream>
#include <string>
#include <vector>

#include "str.h"

using namespace std;

struct Element {
    union ElementValue {
        size_t nonTerminal;
        char terminal;

        explicit ElementValue(char val) : terminal(val) {}
        explicit ElementValue(size_t val) : nonTerminal(val) {}
    } value;
    enum ElementKind { Terminal, NonTerminal } kind;

    explicit Element(char value) : value(value), kind(Terminal) {}

    explicit Element(size_t value) : value(value), kind(NonTerminal) {}

    friend ostream &operator<<(ostream &os, const Element &e) {
      switch (e.kind) {
      case Terminal:
        os << "Terminal(" << e.value.terminal << ')';
        return os;
      case NonTerminal:
        os << "NonTerminal(" << e.value.nonTerminal << ')';
        return os;
      }
    }
};

struct Grammar { 
    vector<string> non_terminals;
    vector<size_t> nt_sorted;
    vector<size_t> start_ptr;
    vector<size_t> num_rules;
    vector<vector<Element>> prods;
    
    Grammar(const string & from) 
    : non_terminals() 
    , nt_sorted()
    , start_ptr()
    , num_rules()
    , prods()
    {
        str_slice sl = str_slice_new_cstr((char *)from.data(), from.size());
        
        str_slice_debug_verbose(&sl);
        
        str_iterator lines = str_slice_iter(&sl, (char *)"\n");
        
        while (!lines.ended) {
            str_slice line = str_iter_next(&lines);
            
            if (line.len == 0) continue;
            
            str_slice_debug(&line);
        }
    }
};

string read_file(const string &p) {
  ifstream in(p);
  
  in.seekg(0, ios::end);
  size_t len = in.tellg();
  in.seekg(0);
  
  string contenidos(len, ' ');
  
  in.read(&contenidos[0], len); 

  return contenidos;
}

int main() {
  srand(time(NULL));
  vector<Element> vec{};

  for (int i = 0; i < 10; i++) {
    if (rand() % 2 == 0)
      vec.emplace_back('a');
    else
      vec.emplace_back((size_t)'a');
  }

  while (vec.size() > 0) {
    Element e = vec.back();
    vec.pop_back();

    cout << e << endl;
  }

  string c = read_file("./gramatica.txt");
  
  cout << c << '\n';
  Grammar g = Grammar(c);

  return 0;
}
