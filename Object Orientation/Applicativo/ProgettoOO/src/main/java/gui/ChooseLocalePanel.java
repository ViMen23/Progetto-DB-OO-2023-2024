package gui;

import controller.Controller;
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

public class ChooseLocalePanel
				extends JPanel
{
	private Locale choosedLocale;

	public ChooseLocalePanel()
	{
		MigLayout migLayout;
		JLabel messageLabel;
		JComboBox<String> localeComboBox;
		JButton okButton;

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						null,
						GuiConfiguration.TWO_CELL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);
		/*------------------------------------------------------------------------------------------------------*/

		messageLabel = new JLabel(GuiConfiguration.getMessage("chooseLocale"));
		this.add(messageLabel, GuiConfiguration.HGROUP_ADD_CONSTRAINT);
		/*------------------------------------------------------------------------------------------------------*/

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

		this.add(localeComboBox, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

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

		localeComboBox.addItem("Italiano");
		localeComboBox.addItem("Inglese");
		/*------------------------------------------------------------------------------------------------------*/

		okButton = new JButton(GuiConfiguration.getMessage("confirm"));
		this.add(okButton, GuiConfiguration.HGROUP_ADD_CONSTRAINT);

		okButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				Window window = SwingUtilities.getWindowAncestor((Component) e.getSource());
				window.dispose();

				GuiConfiguration.setLocale(getChoosedLocale());

				if (Controller.getInstance().isAdminConnected()) {

					Container container = MainFrame.getMainFrameInstance().getContentPane();
					for (Component component: container.getComponents()) {
						if (!(component instanceof TopPanel)) {
							component.setVisible(false);
							container.remove(component);
						}
					}


					container.add(new AdminNavigationPanel(new JPanel()), GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);

				}
				else {
					GuiConfiguration.resetHomeFrame();
				}
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
