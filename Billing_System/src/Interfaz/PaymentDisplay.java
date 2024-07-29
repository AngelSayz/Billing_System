package Interfaz;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;

public class PaymentDisplay {
    private static final Map<String, Integer> paymentPrices = new HashMap<>();

    static {
        paymentPrices.put("Incripción", 1000);
        paymentPrices.put("Paquete de Libros", 500);
        paymentPrices.put("Examen", 300);
        paymentPrices.put("Mensualidad", 1500);
        paymentPrices.put("Evento", 200);
        paymentPrices.put("Paquete de Material", 400);
    }

    public static String PaymentMenu() {
        String[] paymentTypes = paymentPrices.keySet().toArray(new String[0]);
        JComboBox<String> paymentBox = new JComboBox<>(paymentTypes);
        JLabel priceLabel = new JLabel("Precio: $" + paymentPrices.get(paymentTypes[0]));

        paymentBox.addActionListener(new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                String selectedPayment = (String) paymentBox.getSelectedItem();
                priceLabel.setText("Precio: $" + paymentPrices.get(selectedPayment));
            }
        });

        JPanel panel = new JPanel();
        panel.setLayout(new GridLayout(3, 1));
        panel.add(new JLabel("Seleccione el tipo de pago:"));
        panel.add(paymentBox);
        panel.add(priceLabel);

        int result = JOptionPane.showConfirmDialog(null, panel, "Generar referencia de pago", JOptionPane.OK_CANCEL_OPTION, JOptionPane.QUESTION_MESSAGE);
        
        if (result == JOptionPane.OK_OPTION) {
            String selectedPayment = (String) paymentBox.getSelectedItem();
            return generatePaymentReference(selectedPayment, paymentPrices.get(selectedPayment));
        } else {
            return null;
        }
    }

    private static String generatePaymentReference(String paymentType, int price) {
        // Aquí puedes implementar la lógica para generar la referencia de pago
        // Por ahora, solo devolvemos una cadena de ejemplo
        return "Referencia generada para " + paymentType + " con precio $" + price;
    }

    public static void main(String[] args) {
        String reference = PaymentMenu();
        if (reference != null) {
            System.out.println(reference);
        } else {
            System.out.println("Operación cancelada.");
        }
    }
}
