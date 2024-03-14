package gui;

import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.util.HashSet;
import java.util.Locale;
import java.util.ResourceBundle;
import java.util.Set;
//TODO
public class ChooseLocalePanel
				extends JPanel
{
	private final JLabel messageLabel;
	private final JComboBox<String> localeComboBox;
	private final JButton okButton;

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
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * LABEL SCEGLI LOCALE
		 *------------------------------------------------------------------------------------------------------*/



		string = "";
		string += GuiConfiguration.getMessage("choose");
		string += " ";
		string += GuiConfiguration.getMessage("locale");
		string = StringUtils.capitalize(string);

		messageLabel = new JLabel(string);

		add(messageLabel);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * COMBOBOX LOCALE
		 *------------------------------------------------------------------------------------------------------*/


		Set<Locale> localeSet = new HashSet<>();
		for (Locale locale : Locale.getAvailableLocales()) {
			try {
				ResourceBundle resourceBundle = ResourceBundle.getBundle("guiBundle", locale);
				localeSet.add(resourceBundle.getLocale());
			} catch (Exception ignore) {

			}
		}

		for (Locale locale : localeSet) {
			System.out.println(GuiConfiguration.getMessage(locale.toString()));
		}



		localeComboBox = new JComboBox<>();

		localeComboBox.addItem("Italiano");
		localeComboBox.addItem("Inglese");
		localeComboBox.setSelectedIndex(-1);

		add(localeComboBox);



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		localeComboBox.addItemListener(new ItemListener() {
			@Override
			public void itemStateChanged(ItemEvent e)
			{
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
		/*------------------------------------------------------------------------------------------------------*/


		okButton = new JButton(GuiConfiguration.getMessage("confirm"));

		add(okButton);
		/*------------------------------------------------------------------------------------------------------*/



		/*--------------------------------------------------------------------------------------------------------
		 * IMPLEMENTAZIONE LOGICA
		 *------------------------------------------------------------------------------------------------------*/



		okButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Window window = SwingUtilities.getWindowAncestor((Component) e.getSource());
				window.dispose();

				GuiConfiguration.setLocale(getChoosedLocale());
				GuiConfiguration.resetHomeFrame();
			}
		});
		/*------------------------------------------------------------------------------------------------------*/
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
