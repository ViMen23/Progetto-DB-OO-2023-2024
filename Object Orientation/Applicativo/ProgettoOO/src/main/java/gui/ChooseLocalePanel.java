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



		/*--------------------------------------------------------------------------------------------------------
		 * BUTTON CONFERMA
		 *------------------------------------------------------------------------------------------------------*/



		string = "";
		string += GuiConfiguration.getMessage("confirm");
		string = string.toUpperCase();

		okButton = new JButton(string);

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
				MainFrame.getMainFrameInstance().add(new SearchPlayerPanel(), "sgx frame, growy"); //TODO REMOVE IN THE END
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
