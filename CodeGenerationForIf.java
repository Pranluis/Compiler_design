import java.util.*;

public class CodeGenerationForIf {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);

        // Prompt user for condition and action
        System.out.println("Enter the condition (e.g., x > 5):");
        String condition = scanner.nextLine();

        System.out.println("Enter the action (e.g., y = x * 2;):");
        String action = scanner.nextLine();

        // Generate code for the if statement
        String generatedCode = generateIfCode(condition, action);

        System.out.println("Generated code:");
        System.out.println(generatedCode);

        scanner.close();
    }

    public static String generateIfCode(String condition, String action) {
        StringBuilder codeBuilder = new StringBuilder();

        // Add the if statement
        codeBuilder.append("if (").append(condition).append(") {\n");

        // Add the action inside the if block
        codeBuilder.append("\t").append(action).append("\n");

        // Close the if block
        codeBuilder.append("}");

        return codeBuilder.toString();
    }
}
