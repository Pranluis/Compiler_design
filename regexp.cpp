#include <iostream>
#include <regex>
#include <string>

int main() {
    // Regular expression pattern
    std::string pattern;

    // Get regular expression pattern from user
    std::cout << "Enter regular expression pattern: ";
    std::getline(std::cin, pattern);

    // Compile regular expression
    std::regex regEx(pattern);

    // Input string to match
    std::string input;

    // Get input string from user
    std::cout << "Enter input string: ";
    std::getline(std::cin, input);

    // Match the input string against the pattern
    if (std::regex_match(input, regEx)) {
        std::cout << "Input string matches the pattern." << std::endl;
    } else {
        std::cout << "Input string does not match the pattern." << std::endl;
    }

    return 0;
}
