package gui;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import javax.swing.plaf.ColorUIResource;
import javax.swing.plaf.FontUIResource;
import java.awt.*;
import java.util.*;

/**
 * TYPE : class - gui package
 * NAME : GuiConfiguration
 *
 * DESC: TODO
 */
public class GuiConfiguration
{
	private static ResourceBundle currentResourceBundle;

	private static Integer inputColumn;

	private static Font outputFont;
	private static Font outputBoldFont;
	private static Font outputLargeFont;
	private static Font outputBoldLargeFont;
	private static Font outputSmallFont;
	private static Font outputBoldSmallFont;

	private static Integer tableRowHeight;

	private static Integer comboBoxMaximumRowCount;

	private static Cursor buttonCursor;

	private static Border searchPanelBorder;

	private static Border labelBorder;

	private static Dimension frameMinimumSize;


	private static Color searchPanelColor;


	/**
	 * TYPE : static method - gui package
	 * NAME : initGuiConfiguration
	 *
	 * DESC: TODO
	 */
	public static void initGuiConfiguration()
	{
		// creazione del locale di default come italiano
		setLocale(Locale.of("it", "IT"));


		// text and password field config
		inputColumn = 25;

		//tabella config
		tableRowHeight = 25;

		//combo box config
		comboBoxMaximumRowCount = 5;

		// bottone config
		buttonCursor = new Cursor(Cursor.HAND_CURSOR);

		//bordo per i pannelli ricerca
		searchPanelBorder = new CompoundBorder
								(
									new EmptyBorder(0, 0, 10, 0),
									new MatteBorder(0, 10, 10, 10, Color.WHITE)
								);

		//bordo label config
		labelBorder = new CompoundBorder
							(
								new EmptyBorder(4, 4, 4, 4),
								new MatteBorder(0, 0, 1, 0, Color.BLACK)
							);

		//minima size del frame
		frameMinimumSize = new Dimension(1500, 1000);

		searchPanelColor = new Color(50, 100, 200);

		initUIManager();
		initHomeFrame();
	}

	public static void initHomeFrame()
	{
		JFrame mainFrame = MainFrame.getMainFrameInstance();

		TopPanel topPanel = new TopPanel();
		topPanel.setName("topPanel");

		mainFrame.add(topPanel);

		MenuBarPanel menuBarPanel = new MenuBarPanel();
		menuBarPanel.setName("menuBarPanel");

		mainFrame.add(menuBarPanel);

		mainFrame.pack();
		mainFrame.setVisible(true);
	}

	public static void resetHomeFrame()
	{
		for (Component component : MainFrame.getMainFrameInstance().getContentPane().getComponents()) {
			MainFrame.getMainFrameInstance().remove(component);
		}

		initHomeFrame();
	}


	/**
	 * TYPE : static method - gui package
	 * NAME : initGuiConfiguration
	 *
	 * DESC: TODO
	 */

	public static void initUIManager()
	{
		try {
			for (UIManager.LookAndFeelInfo info : UIManager.getInstalledLookAndFeels()) {
				if ("Nimbus".equals(info.getName())) {
					UIManager.setLookAndFeel(info.getClassName());
					break;
				}
			}
		} catch (Exception e) {
			System.err.println("Error nimbus not found");
			return;
		}


		//font testo
		Font font = new JPanel().getFont();

		float size = 25;

		outputLargeFont = font.deriveFont(size);
		outputBoldLargeFont = outputLargeFont.deriveFont(Font.BOLD);

		size = 18;

		outputFont = font.deriveFont(size);;
		outputBoldFont = outputFont.deriveFont(Font.BOLD);

		size = 13;

		outputSmallFont = font.deriveFont(size);
		outputBoldSmallFont = outputSmallFont.deriveFont(Font.BOLD);



		//Configurazioni generali
		UIManager.put("nimbusBase", new Color(130, 130, 130));
		UIManager.put("nimbusBlueGrey", new Color(50, 100, 150));
		UIManager.put("control", new Color(200, 200, 200));
		//UIManager.put("defaultFont", outputFont);


		//Configurazioni bottone
		UIManager.put("Button.font", outputFont);
		//UIManager.put("Button.foreground", Color.white);
		UIManager.put("Button.textForeground", Color.white);

		//Configurazioni checkBox
		UIManager.put("CheckBox.background", Color.green);
		UIManager.put("CheckBox.font", outputFont);


		//Configurazioni comboBox

		//UIManager.put("ComboBox.background", Color.green); --VERIFY
		UIManager.put("ComboBox.font", outputFont);
		UIManager.put("ComboBox.foreground", Color.white);
		//UIManager.put("ComboBox.isEnterSelectablePopup", true);


		//Configurazioni radioButton
		UIManager.put("RadioButton.background", Color.green);
		UIManager.put("RadioButton.font", outputFont);
		UIManager.put("RadioButton.foreground", Color.white);
		//UIManager.put("RadioButton[Enabled].textForeground", Color.black);


		//Configurazioni label
		UIManager.put("Label.background", Color.green);
		UIManager.put("Label.font", outputFont);
		UIManager.put("Label.foreground", Color.white);
		UIManager.put("Label[Enabled].textForeground", Color.black);


		//configurazioni menu
		//UIManager.put("Menu.background", Color.green);
		UIManager.put("Menu.font", outputFont);
		//UIManager.put("Menu.foreground", Color.white);
		//UIManager.put("Menu.menuPopupOffsetX", 0);
		//UIManager.put("Menu.menuPopupOffsetY", 0);
		//UIManager.put("Menu.submenuPopupOffsetX", 0);
		//UIManager.put("Menu.submenuPopupOffsetY", 0);
		//UIManager.put("menuText", ColorUIResource.GREEN);
		UIManager.put("Menu[Enabled].textForeground", Color.white);



		//configurazioni menuBar
		//UIManager.put("MenuBar.background", Color.green);
		//UIManager.put("MenuBar.font", outputFont);
		//UIManager.put("MenuBar.foreground", Color.white);

		//configurazioni menuItem
		UIManager.put("MenuItem.font", outputSmallFont);
		//UIManager.put("MenuItem.foreground", Color.white);


		//configurazioni panel
		//UIManager.put("Panel.background", Color.BLACK);
		UIManager.put("Panel.font", outputFont);
		//UIManager.put("Panel.foreground", Color.GREEN);


		// configurazioni text field
		UIManager.put("TextField.font", outputFont);


		//configurazioni field password
		UIManager.put("PasswordField.font", outputFont);
		UIManager.put("PasswordField.echoChar", (char)'⚫');

		//configurazioni popup menu

		//UIManager.put("PopupMenu.background", Color.white);
		//UIManager.put("PopupMenu.disabled", Color.white);
		//UIManager.put("PopupMenu.disabledText", Color.white);
		//UIManager.put("PopupMenu.foreground", Color.white);
		//UIManager.put("PopupMenu.font", outputFont);


		//configurazioni table
		UIManager.put("Table.font", outputFont);
		UIManager.put("Table.textForeground", Color.black);

		//configurazione intestazione tabella
		UIManager.put("TableHeader.font", outputBoldFont);
		UIManager.put("TableHeader.textForeground", Color.white);


		//configurazioni text
		//UIManager.put("textForeground", Color.white);

	}

	public static void setLocale(Locale locale)
	{
		Locale.setDefault(locale);
		setResourceBundle(locale);
	}


	/**
	 * TYPE : static method - gui package
	 * NAME : getMessage
	 *
	 * DESC: TODO
	 */
	public static String getMessage(String key)
	{
		try {
			return currentResourceBundle.getString(key);
		} catch(Exception e) {
			System.out.println(e.getMessage());
			return "";
		}
	}

	/**
	 * TYPE : static method - gui package
	 * NAME : getInputColumn
	 *
	 * DESC: TODO
	 */
	public static Integer getInputColumn() { return inputColumn; }

	/**
	 * TYPE : static method - gui package
	 * NAME : outputLargeFont
	 *
	 * DESC: TODO
	 */
	public static Font outputLargeFont() { return outputLargeFont; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getOutputBoldLargeFont
	 *
	 * DESC: TODO
	 */
	public static Font getOutputBoldLargeFont() { return outputBoldLargeFont; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getOutputFont
	 *
	 * DESC: TODO
	 */
	public static Font getOutputFont() { return outputFont; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getOutputBoldFont
	 *
	 * DESC: TODO
	 */
	public static Font getOutputBoldFont() { return outputBoldFont; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getOutputSmallFont
	 *
	 * DESC: TODO
	 */
	public static Font getOutputSmallFont() { return outputSmallFont; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getOutputBoldSmallFont
	 *
	 * DESC: TODO
	 */
	public static Font getOutputBoldSmallFont() { return outputBoldSmallFont; }


	/**
	 * TYPE : static method - gui package
	 * NAME : getTableRowHeight
	 *
	 * DESC: TODO
	 */
	public static Integer getTableRowHeight() { return tableRowHeight; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getComboBoxMaximumRowCount
	 *
	 * DESC: TODO
	 */
	public static Integer getComboBoxMaximumRowCount() { return comboBoxMaximumRowCount; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getButtonCursor
	 *
	 * DESC: TODO
	 */
	public static Cursor getButtonCursor() { return buttonCursor; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getSearchPanelBorder
	 *
	 * DESC: TODO
	 */
	public static Border getSearchPanelBorder() { return searchPanelBorder; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getLabelBorder
	 *
	 * DESC: TODO
	 */
	public static Border getLabelBorder() { return labelBorder; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getFrameMinimumSize
	 *
	 * DESC: TODO
	 */
	public static Dimension getFrameMinimumSize() { return frameMinimumSize; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getSearchPanelColor
	 *
	 * DESC: TODO
	 */
	public static Color getSearchPanelColor() { return searchPanelColor; }


	/**
	 * TYPE : static method - gui package
	 * NAME : setResourceBundle
	 *
	 * DESC: TODO
	 */
	public static boolean setResourceBundle(Locale locale)
	{
		try
		{
			currentResourceBundle = ResourceBundle.getBundle("guiBundle", locale);
		}
		catch (MissingResourceException e)
		{
			System.out.println(e.getMessage());
			return false;
		}

		return true;
	}


	/**
	 * TYPE : static method - gui package
	 * NAME : createImageIcon
	 *
	 * DESC: TODO
	 */
	public static ImageIcon createImageIcon(String imagePath) { return createImageIcon(imagePath, 30, 30); }


	/**
	 * TYPE : static method - gui package
	 * NAME : createImageIcon
	 *
	 * DESC: TODO
	 */
	public static ImageIcon createImageIcon(String imagePath, int width, int height)
	{
		java.net.URL imageURL = ClassLoader.getSystemResource(imagePath);

		if (imageURL != null) {
			ImageIcon imageIcon = new ImageIcon(imageURL);
			Image image = imageIcon.getImage().getScaledInstance(width, height, Image.SCALE_DEFAULT);

			return new ImageIcon(image);
		}

		return null;
	}
}
