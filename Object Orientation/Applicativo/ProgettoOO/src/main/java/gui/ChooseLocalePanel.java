package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.Locale;

public class ChooseLocalePanel
				extends JPanel
{
	protected JLabel messageLabel;
	protected JComboBox<String> localeComboBox;
	protected JButton okButton;

	private Locale choosedLocale;

	public ChooseLocalePanel()
	{
		String string;
		MigLayout migLayout;

		migLayout = new MigLayout
						(
										"debug, flowy, center",
										"[center]",
										"30:push[]20[]20[]30:push"
						);

		setLayout(migLayout);

		/*
		 * TODO
		 */
		string = "";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("locale");
		string = StringUtils.capitalize(string);

		messageLabel = new JLabel(string);

		add(messageLabel);

		/*
		 * TODO
		 */
		localeComboBox = new JComboBox<String>();

		localeComboBox.addItem("Italiano");
		localeComboBox.addItem("Inglese");
		localeComboBox.setSelectedIndex(-1);

		localeComboBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e) {
				String choice = (String) e.getItem();

				switch (choice) {
					case "Italiano":
						setChoosedLocale(Locale.of("it", "IT"));
						break;
					case "Inglese":
						setChoosedLocale(Locale.of("en", "US"));
						break;
				}
			}
		});


		add(localeComboBox);


		/*
		 * TODO
		 */
		string = "";
		string += GuiConfiguration.getMessage("confirm");
		string = string.toUpperCase();

		okButton = new JButton(string);

		okButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e) {
				Window window = SwingUtilities.getWindowAncestor((Component) e.getSource());
				window.dispose();

				GuiConfiguration.setLocale(getChoosedLocale());
				GuiConfiguration.resetHomeFrame();
			}
		});

		add(okButton);
	}

	private void setChoosedLocale(Locale locale)
	{
		choosedLocale = locale;
	}

	private Locale getChoosedLocale()
	{
		return choosedLocale;
	}

}
