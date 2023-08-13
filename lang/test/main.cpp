#include <iostream>
#include <iterator>
#include<vector>

using namespace std;

template<template<typename, class> class Container, class T, class A>
Container<T, A> collection_union(const Container<T, A>& lval, const Container<T, A>& rval) {
  Container<T, A> res = lval;
  for_each(rval.cbegin(), rval.cend(), [&](const T& val) {
    if (find(res.cbegin() , res.cend(), val) == end(res)) res.emplace_back(val);
  });
  return res;
}

template<template<typename, class> class Container, class T, class A>
Container<T, A> compare(const Container<T, A>& lval, const Container<T, A>& rval) {
  Container<T, A> res = lval;
  for_each(rval.cbegin(), rval.cend(), [&](const T& val) {
    if (find(res.cbegin() , res.cend(), val) == end(res)) res.emplace_back(val);
  });
  return res;
}

int main() {

  vector<int> a { 1, 3 };
  vector<int> b { 2, 3, 4 };
  vector<int> c { collection_union(a, b) };

  for (const int& i: c) cout << i << ' ';
  cout << endl;
  
  return 0;
}
