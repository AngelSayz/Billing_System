package Interfaz;

import javax.swing.*;
import java.awt.*;
import java.time.LocalDate;
import java.time.YearMonth;

public class DateDisplay {
    public static String getValidDate(String prompt) {
        String[] years = new String[17];
        for (int i = 0; i < years.length; i++) {
            years[i] = Integer.toString(2008 + i);
        }

        String[] months = { "Enero", "Febrero", "Marzo", "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre",
                "Octubre", "Noviembre", "Diciembre" };

        JComboBox<String> yearBox = new JComboBox<>(years);
        JComboBox<String> monthBox = new JComboBox<>(months);
        JComboBox<String> dayBox = new JComboBox<>();

        monthBox.addActionListener(e -> updateDays(yearBox, monthBox, dayBox));
        yearBox.addActionListener(e -> updateDays(yearBox, monthBox, dayBox));

        updateDays(yearBox, monthBox, dayBox);

        while (true) {
            JPanel panel = new JPanel();
            panel.setLayout(new GridLayout(4, 2));
            JLabel label = new JLabel(prompt);

            panel.add(label);
            panel.add(new JLabel()); // vacio para hacer espacio
            panel.add(new JLabel("Año:"));
            panel.add(yearBox);
            panel.add(new JLabel("Mes:"));
            panel.add(monthBox);
            panel.add(new JLabel("Día:"));
            panel.add(dayBox);
            JFrame jf = new JFrame();
            jf.setAlwaysOnTop(true);
            int result = JOptionPane.showConfirmDialog(jf, panel, "Seleccionar fecha", JOptionPane.OK_CANCEL_OPTION,
                    JOptionPane.QUESTION_MESSAGE);

            if (result == JOptionPane.OK_OPTION) {
                String year = (String) yearBox.getSelectedItem();
                String month = Integer.toString(monthBox.getSelectedIndex() + 1);
                String day = (String) dayBox.getSelectedItem();
                String input = year + "-" + String.format("%02d", Integer.parseInt(month)) + "-" + day;

                if (isValidDate(input)) {
                    return input;
                } else {
                    JOptionPane.showMessageDialog(null,
                            "Fecha inválida. Por favor, ingrese una fecha válida dentro del rango permitido.", "Error",
                            JOptionPane.ERROR_MESSAGE);
                }
            } else {
                return null;
            }
        }
    }

    private static void updateDays(JComboBox<String> yearBox, JComboBox<String> monthBox, JComboBox<String> dayBox) {
        String selectedYear = (String) yearBox.getSelectedItem();
        int selectedMonth = monthBox.getSelectedIndex() + 1;
        int year = Integer.parseInt(selectedYear);
        YearMonth yearMonth = YearMonth.of(year, selectedMonth);
        int daysInMonth = yearMonth.lengthOfMonth();

        dayBox.removeAllItems();
        for (int i = 1; i <= daysInMonth; i++) {
            dayBox.addItem(String.format("%02d", i));
        }
    }

    public static boolean isValidDate(String date) {
        try {
            LocalDate parsedDate = LocalDate.parse(date);
            LocalDate startDate = LocalDate.of(2008, 1, 1);
            LocalDate endDate = LocalDate.of(2024, 12, 31);
            return !parsedDate.isBefore(startDate) && !parsedDate.isAfter(endDate);
        } catch (Exception e) {
            return false;
        }
    }

}
