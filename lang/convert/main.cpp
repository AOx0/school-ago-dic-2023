#include <iostream>
#include <vector>
#include <string>
#include <sstream>

using namespace std;

int f(char c) {
    switch (c) {
        case '+': case '-':
            return 1;
        case '*': case '/':
            return 3;
        case '^': 
            return 6;
        case '(': 
            return 9;
        case ')':
            return 0;
        default:
            return 7;
    }
}

int g(char c) {
    switch (c) {
        case '+': case '-':
            return 2;
        case '*': case '/':
            return 4;
        case '^': 
            return 5;
        case '(': 
            return 0;
        case ')':
            return -1;
        default:
            return 8;
    }
}

int main() {
  string input;
  size_t idx = 0;
  string out;
  vector<char> stack {'('};

  cout << "Ingrese la expresion: ";
  cin >> input;
  input.push_back(')');
 
  cout << "Value: " << input << endl;
  
  while(input.size() > idx++) {
      char next = input[idx-1];
      bool rparent = false;
     
      while (f(next) <= g(stack.back())) {
          char temp = stack.back();
          stack.pop_back();
          
          if (f(next) < g(temp)) 
              out.push_back(temp);
          else {
              rparent = true;
              break;
          }
      }
      
      if (!rparent) stack.push_back(next);
  }
  
  cout << out << endl;
  return 0;
}
