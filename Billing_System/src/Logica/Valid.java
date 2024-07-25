package Logica;

import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.Scanner;

public class Valid {
public static String getValidString(Scanner sc, String prompt, int maxLength) {
        String input;
        while (true) {
            System.out.print(prompt);
            input = sc.nextLine().trim();
            if (input.isEmpty()) {
                System.out.println("Entrada inválida. Por favor, ingrese un valor no vacío.");
            } else if (input.length() > maxLength) {
                System.out.println("Entrada inválida. El valor no debe exceder " + maxLength + " caracteres.");
            } else {
                break;
            }
        }
        return input;
    }
        public static String getValidDate(Scanner sc, String prompt) {
        String input;
        while (true) {
            System.out.print(prompt);
            input = sc.nextLine().trim();
            if (input.matches("\\d{4}-\\d{2}-\\d{2}") && isValidDate(input)) {
                break;
            } else {
                System.out.println("Entrada inválida. Por favor, ingrese una fecha válida en el formato YYYY-MM-DD.");
            }
        }
        return input;
    }

    public static boolean isValidDate(String date) {
        try {
            LocalDate parsedDate = LocalDate.parse(date);
            LocalDate startDate = LocalDate.of(2008, 1, 1);
            LocalDate endDate = LocalDate.of(2024, 12, 31);
            return !parsedDate.isBefore(startDate) && !parsedDate.isAfter(endDate);
        } catch (DateTimeParseException e) {
            return false;
        }
    }
    public static int getValidInt(Scanner sc, String prompt) {
        Integer input = null;
        while (input == null) {
            System.out.print(prompt);
            String userInput = sc.nextLine().trim();
            if (userInput.isEmpty()) {
                System.out.println("Entrada inválida. Por favor, ingrese un valor no vacío.");
            } else {
                try {
                    input = Integer.parseInt(userInput);
                    if (input <= 0) {
                        System.out.println("Entrada inválida. Por favor, ingrese un número mayor a 0.");
                        input = null;
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Entrada inválida. Por favor, ingrese un número entero.");
                }
            }
        }
        return input;
    }
public static int getValidIntMenu(Scanner sc, String prompt, int min, int max) {
        Integer input = null;
        while (input == null) {
            System.out.print(prompt);
            String userInput = sc.nextLine().trim();
            if (userInput.isEmpty()) {
                System.out.println("Entrada inválida. Por favor, ingrese un valor no vacío.");
            } else {
                try {
                    input = Integer.parseInt(userInput);
                    if (input < min || input > max) {
                        System.out.println("Entrada inválida. Por favor, ingrese una opcion valida.");
                        input = null; 
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Entrada inválida. Por favor, ingrese un número entero.");
                }
            }
        }
        return input;
    }    
    public static double getValidDouble(Scanner scanner, String prompt) {
        Double input = null;
        while (input == null) {
            System.out.print(prompt);
            String userInput = scanner.nextLine().trim();
            if (userInput.isEmpty()) {
                System.out.println("Entrada inválida. Por favor, ingrese un valor no vacío.");
            } else {
                try {
                    input = Double.parseDouble(userInput);
                    if (input <= 0) {
                        System.out.println("Entrada inválida. Por favor, ingrese un número mayor a 0.");
                        input = null;
                    }
                } catch (NumberFormatException e) {
                    System.out.println("Entrada inválida. Por favor, ingrese un número válido.");
                }
            }
        }
        return input;
    }
    
public static void clear() {
        System.out.print("\033[H\033[2J");
        System.out.flush();
    }
    
    public static String getValidOptionalString(Scanner scanner, String prompt, int maxLength) {
        String input;
        while (true) {
            System.out.print(prompt);
            input = scanner.nextLine().trim();
            if (input.length() > maxLength) {
                System.out.println("Entrada inválida. El valor no debe exceder " + maxLength + " caracteres.");
            } else {
                break;
            }
        }
        return input;
    }
    
}
