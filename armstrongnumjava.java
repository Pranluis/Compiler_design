import java.util.Scanner; 
public class ArmstrongNumber { 
public static void main(String[] args) { 
Scanner scanner = new Scanner(System.in); 
System.out.print("Enter a number: "); 
int number = scanner.nextInt(); 
int originalNumber, remainder, result = 0, n = 0; 
originalNumber = number; 
// Find the number of digits 
for (originalNumber = number; originalNumber != 0; originalNumber /= 10) { 
++n; 
} 
originalNumber = number; 
// Check if the number is armstrong 
while (originalNumber != 0) { 
remainder = originalNumber % 10; 
result += Math.pow(remainder, n); 
originalNumber /= 10; 
} 
if (result == number) 
System.out.println(number + " is an Armstrong number."); 
else 
System.out.println(number + " is not an Armstrong number."); 
} 
}
