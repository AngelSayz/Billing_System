package Logica;

import java.util.Scanner;

public class Valid {
    public static String getValidString(Scanner sc, String prompt, int maxLength) {
        String input;
        while (true) {
            System.out.print(prompt);
            input = sc.nextLine().trim();
            if (input.isEmpty()) {
                System.out.println("╔═════════════════════════════════════════════════════════╗");
                System.out.println("║ Entrada inválida. Por favor, ingrese un valor no vacío. ║");
                System.out.println("╚═════════════════════════════════════════════════════════╝");

            } else if (input.length() > maxLength) {
                System.out.println("╔══════════════════════════════════════════════════════════════╗");
                System.out.printf("║  Entrada inválida. El valor no puede exceder %02d caracteres.  ║%n", maxLength);
                System.out.println("╚══════════════════════════════════════════════════════════════╝");
            } else {
                break;
            }
        }
        return input;
    }

    public static int getValidInt(Scanner sc, String prompt) {
        Integer input = null;
        while (input == null) {
            System.out.print(prompt);
            String userInput = sc.nextLine().trim();
            if (userInput.isEmpty()) {
                System.out.println("╔═════════════════════════════════════════════════════════╗");
                System.out.println("║ Entrada inválida. Por favor, ingrese un valor no vacío. ║");
                System.out.println("╚═════════════════════════════════════════════════════════╝");
            } else {
                try {
                    input = Integer.parseInt(userInput);
                    if (input <= 0) {
                        System.out.println("╔═══════════════════════════════════════════════════════════╗");
                        System.out.println("║ Entrada inválida. Por favor, ingrese un número mayor a 0. ║");
                        System.out.println("╚═══════════════════════════════════════════════════════════╝");
                        input = null;
                    }
                } catch (NumberFormatException e) {
                    System.out.println("╔════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese un número entero. ║");
                    System.out.println("╚════════════════════════════════════════════════════════╝");

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
                System.out.println("╔═════════════════════════════════════════════════════════╗");
                System.out.println("║ Entrada inválida. Por favor, ingrese un valor no vacío. ║");
                System.out.println("╚═════════════════════════════════════════════════════════╝");
            } else {
                try {
                    input = Integer.parseInt(userInput);
                    if (input < min || input > max) {
                        System.out.println("╔═════════════════════════════════════════════════════════╗");
                        System.out.println("║ Entrada inválida. Por favor, ingrese una opcion valida. ║");
                        System.out.println("╚═════════════════════════════════════════════════════════╝");
                        input = null;
                    }
                } catch (NumberFormatException e) {
                    System.out.println("╔════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese un número entero. ║");
                    System.out.println("╚════════════════════════════════════════════════════════╝");
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
                System.out.println("╔═════════════════════════════════════════════════════════╗");
                System.out.println("║ Entrada inválida. Por favor, ingrese un valor no vacío. ║");
                System.out.println("╚═════════════════════════════════════════════════════════╝");
            } else {
                try {
                    input = Double.parseDouble(userInput);
                    if (input <= 0) {
                        System.out.println("╔═══════════════════════════════════════════════════════════╗");
                        System.out.println("║ Entrada inválida. Por favor, ingrese un número mayor a 0. ║");
                        System.out.println("╚═══════════════════════════════════════════════════════════╝");
                        input = null;
                    }
                } catch (NumberFormatException e) {
                    System.out.println("╔════════════════════════════════════════════════════════╗");
                    System.out.println("║ Entrada inválida. Por favor, ingrese un numero valido. ║");
                    System.out.println("╚════════════════════════════════════════════════════════╝");
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
                System.out.println("╔══════════════════════════════════════════════════════════════╗");
                System.out.printf("║  Entrada inválida. El valor no puede exceder %02d caracteres.  ║%n", maxLength);
                System.out.println("╚══════════════════════════════════════════════════════════════╝");
            } else {
                break;
            }
        }
        return input;
    }

}
