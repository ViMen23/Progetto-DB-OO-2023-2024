
package gui;

import controller.Controller;

import javax.swing.*;
import javax.swing.event.CaretEvent;
import javax.swing.event.CaretListener;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.ResourceBundle;


/**
 * TYPE : class - gui package
 * NAME : UserFilterPanel
 *
 * DESC: TODO
 */

public class UserAdvancedSearchPanel
	extends JPanel
	implements ActionListener, CaretListener, ItemListener
{
	protected JLabel categoryNameLabel;
	protected JLabel nameLabel;
	protected JLabel surnameLabel;
	protected JTextField nameField;
	protected JTextField surnameField;
	protected JLabel categoryPersInfoLabel;
	protected JLabel bornCountryLabel;
	protected JComboBox<String> bornCountryComboBox;
	protected JLabel dobLabel;
	protected JLabel ageLabel;

	final static float outputFontSize = 22;
	final static float inputFontSize = 20;
	final static int inputColumn = 25;
	final static int rowCount = 5;
	public UserAdvancedSearchPanel(Controller controller, ResourceBundle currentLocale)
	{
		setLayout(new GridBagLayout());

		GridBagConstraints gbc;

		Font outputFont = this.getFont().deriveFont(outputFontSize);
		Font inputFont = this.getFont().deriveFont(inputFontSize);


		// configurazione label categoria nome
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 0;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(10,0,0,0);

		categoryNameLabel = new JLabel(currentLocale.getString("categoryName"), SwingConstants.CENTER);
		categoryNameLabel.setFont(outputFont);

		add(categoryNameLabel, gbc);

		// configurazione label nome
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(10,0,0,0);

		nameLabel = new JLabel(currentLocale.getString("nameLabel"), SwingConstants.LEADING);
		nameLabel.setFont(outputFont);

		add(nameLabel, gbc);

		// configurazione campo di testo per il nome
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 1;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(10,0,0,0);

		nameField = new JTextField(inputColumn);
		nameField.setFont(inputFont);

		add(nameField, gbc);

		// configurazione label surname
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 2;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(10,0,0,0);

		surnameLabel = new JLabel(currentLocale.getString("surnameLabel"), SwingConstants.LEADING);
		surnameLabel.setFont(outputFont);

		add(surnameLabel, gbc);

		// configurazione campo di testo per il cognome
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 2;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(10,0,0,0);

		surnameField = new JTextField(inputColumn);
		surnameField.setFont(inputFont);

		add(surnameField, gbc);

		// configurazione label categoria informazioni personali
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 3;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(10,0,0,0);

		categoryPersInfoLabel = new JLabel( currentLocale.getString("categoryPersonalInformationLabel"),
			SwingConstants.CENTER );

		categoryPersInfoLabel.setFont(outputFont);

		add(categoryPersInfoLabel, gbc);

		// configurazione label paese di nascita
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 4;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(10,0,0,0);

		bornCountryLabel = new JLabel(currentLocale.getString("bornCountryLabel"), SwingConstants.LEADING);
		bornCountryLabel.setFont(outputFont);

		add(bornCountryLabel, gbc);

		//configurazione combobox per il paese di nascita
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 1;
		gbc.gridy = 4;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(10,0,0,0);

		bornCountryComboBox = new JComboBox<String>();
		bornCountryComboBox.setEditable(true);
		bornCountryComboBox.setMaximumRowCount(rowCount);

		add(bornCountryComboBox, gbc);

		//configurazione label data di nascita
		gbc = new GridBagConstraints();
		gbc.gridwidth = 1;
		gbc.gridx = 0;
		gbc.gridy = 5;
		gbc.ipadx = 0;
		gbc.ipady = 0;
		gbc.insets = new Insets(10,0,0,0);

		dobLabel = new JLabel(currentLocale.getString("dobLabel"), SwingConstants.LEADING);
		dobLabel.setFont(outputFont);

		add(dobLabel, gbc);

		//configurazione calendario
		
	}


	@Override
	public void actionPerformed(ActionEvent e) {

	}

	@Override
	public void itemStateChanged(ItemEvent e) {

	}

	@Override
	public void caretUpdate(CaretEvent e) {

	}
}
