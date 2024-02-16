/*
package gui;

import controller.Controller;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.ResourceBundle;
*/
/*
public class CompetitionEditionParticipantPanel
				extends JPanel implements ActionListener {
	JLabel label;
	JTable table;
	JScrollPane scrollPane;
	JButton button;
	String tmp;

	final static float outputFontSize = 15;


	public CompetitionEditionParticipantPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		setBackground(Color.white);

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font outputBoldFont = outputFont.deriveFont(Font.BOLD);

		GridBagConstraints gbc;
		Border labelBorder = new CompoundBorder(new EmptyBorder(4, 4, 4, 4),
			new MatteBorder(0, 0, 1, 0, Color.BLACK));


		//squadre partecipanti label

		tmp = currentLocale.getString("teams").toUpperCase()+ " ";
		tmp += currentLocale.getString("participants").toUpperCase() + " ";
		tmp += currentLocale.getString("season").toUpperCase() + " ";
		tmp += "22-23";

		label = new JLabel(tmp, SwingConstants.LEADING);
		label.setFont(outputBoldFont);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(label, gbc);

		//separatore

		label = new JLabel();
		label.setBorder(labelBorder);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.insets = new Insets(0, 0, 0, 0);

		add(label, gbc);


		button = new JButton("Ciao");
		button.setOpaque(true);
		button.addActionListener(this);



		//squadre table

		Object data[][] = new Object[][]
			{
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
					button
				},
				{
					"NAP",
					"SSC NAPOLI",
					"ITALIA",
					button
				}
			};

		table = new JTable(new ResultSearchTableModel("partecipant", data));

		table.setFont(outputFont);
		table.getTableHeader().setFont(outputBoldFont);

		table.setPreferredScrollableViewportSize(new Dimension(50, 100));

		table.getColumn(StringUtils.capitalize(StringUtils.capitalize(Main.currentLocale.getString("go")) + " " +
			Main.currentLocale.getString("to"))).setCellRenderer(new TableRenderer());

		table.getColumn(StringUtils.capitalize(Main.currentLocale.getString("shortName"))).setCellEditor(new TableEditor());

		table.setFillsViewportHeight(true);
		table.setSelectionMode(ListSelectionModel.SINGLE_SELECTION);

		// scroll per la tabella
		scrollPane = new JScrollPane(table);

		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.fill = GridBagConstraints.BOTH;
		gbc.anchor = GridBagConstraints.FIRST_LINE_START;
		gbc.weightx = 0.5;
		gbc.insets = new Insets(10, 0, 0, 0);

		add(scrollPane, gbc);

	}

	@Override
	public void actionPerformed(ActionEvent e) {
		JOptionPane.showMessageDialog(null, "Evviva");
	}
}
*/