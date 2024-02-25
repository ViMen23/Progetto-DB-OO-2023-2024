package gui;

import controller.Controller;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import javax.swing.border.Border;
import javax.swing.border.CompoundBorder;
import javax.swing.border.EmptyBorder;
import javax.swing.border.MatteBorder;
import java.awt.*;
import java.time.Year;
import java.util.*;
import java.util.List;

/**
 * TYPE : class - gui package
 * NAME : GuiConfiguration
 *
 * DESC: TODO
 */
public class GuiConfiguration
{
	private static final Integer inputColumn = 25;
	private static final Integer tableRowHeight = 25;
	private static final Integer comboBoxMaximumRowCount = 5;
	private static final Cursor buttonCursor = new Cursor(Cursor.HAND_CURSOR);
	private static final Border searchLabelBorder = BorderFactory.createEmptyBorder(2,10,2,0);
	private static final Border labelBorder = new CompoundBorder
		(
			new EmptyBorder(4, 4, 4, 4),
			new MatteBorder(0, 0, 1, 0, Color.BLACK)
		);

	private static final Color searchPanelColor = new Color(50, 100, 200);

	private static final String displayValue = "xxxxxxxxxxxxxxxxxxxx";
	private static final List<String> comboBoxDiplayValue = new ArrayList<String>();
	private static final List<String> listStringSelectAll = new ArrayList<>();
	private static final Integer minYear = 1810;
	private static final Integer minAge = 15;
	private static final Integer maxAge = 50;

	private static ResourceBundle currentResourceBundle;

	private static Font outputFont;
	private static Font outputBoldFont;
	private static Font outputLargeFont;
	private static Font outputBoldLargeFont;
	private static Font outputSmallFont;
	private static Font outputBoldSmallFont;


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

		comboBoxDiplayValue.add(displayValue);

		String string = GuiConfiguration.getMessage("select");
		string += " ";
		string += GuiConfiguration.getMessage("all");
		string = StringUtils.capitalize(string);

		listStringSelectAll.add(string);
		listStringSelectAll.add(null);

		initUIManager();
		initHomeFrame();
	}

	public static void initHomeFrame()
	{
		JFrame mainFrame = MainFrame.getMainFrameInstance();

		TopPanel topPanel = new TopPanel();

		mainFrame.add(topPanel, "sgx frame");

		MenuBarPanel menuBarPanel = new MenuBarPanel();

		mainFrame.add(menuBarPanel, "sgx frame");

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

		outputFont = font.deriveFont(size);
		outputBoldFont = outputFont.deriveFont(Font.BOLD);

		size = 13;

		outputSmallFont = font.deriveFont(size);
		outputBoldSmallFont = outputSmallFont.deriveFont(Font.BOLD);


		//Configurazioni generali
		UIManager.put("nimbusBase", new Color(130, 130, 130));
		UIManager.put("nimbusBlueGrey", new Color(50, 100, 150));
		UIManager.put("control", new Color(230, 230, 230));


		//Configurazioni bottone
		UIManager.put("Button.font", outputFont);
		UIManager.put("Button.textForeground", Color.white);

		//Configurazioni checkBox
		UIManager.put("CheckBox.background", Color.green);
		UIManager.put("CheckBox.font", outputFont);

		//Configurazioni comboBox
		UIManager.put("ComboBox.font", outputFont);
		UIManager.put("ComboBox.foreground", Color.white);

		//Configurazioni radioButton
		UIManager.put("RadioButton.background", Color.green);
		UIManager.put("RadioButton.font", outputFont);
		UIManager.put("RadioButton.foreground", Color.white);

		//Configurazioni label
		//UIManager.put("Label.background", Color.green);
		UIManager.put("Label.font", outputFont);
		//UIManager.put("Label.foreground", Color.white);
		UIManager.put("Label[Enabled].textForeground", Color.black);

		//configurazioni menu
		UIManager.put("Menu.font", outputFont);
		UIManager.put("Menu[Enabled].textForeground", Color.white);

		//configurazioni menuItem
		UIManager.put("MenuItem.font", outputSmallFont);

		//configurazioni panel
		UIManager.put("Panel.font", outputFont);

		// configurazioni text field
		UIManager.put("TextField.font", outputFont);

		//configurazioni field password
		UIManager.put("PasswordField.font", outputFont);
		UIManager.put("PasswordField.echoChar", '⚫');

		//configurazioni table
		UIManager.put("Table.font", outputFont);
		UIManager.put("Table.textForeground", Color.black);

		//configurazione intestazione tabella
		UIManager.put("TableHeader.font", outputBoldFont);
		UIManager.put("TableHeader.textForeground", Color.white);

	}


	public static void initComboBoxVector(Vector<String> dataVector, Map<String, String> hashMap, Boolean selectAll)
	{
		String string;

		dataVector.clear();
		hashMap.clear();

		if (selectAll) {
			string = GuiConfiguration.getMessage("select");
			string += " ";
			string += GuiConfiguration.getMessage("all");
			string = StringUtils.capitalize(string);

			dataVector.add(string);
			hashMap.put(string, null);
		}
	}

	public static void setTitleTable(JLabel label,String tableName, int countRows)
	{
		String string;

		string = GuiConfiguration.getMessage("results");
		string += " ";
		string += GuiConfiguration.getMessage(tableName);
		string += " - ";
		string += countRows;
		string += " ";
		string += GuiConfiguration.getMessage("results");
		string = string.toUpperCase();

		label.setText(string);
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
	public static Border getSearchLabelBorder() { return searchLabelBorder; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getLabelBorder
	 *
	 * DESC: TODO
	 */
	public static Border getLabelBorder() { return labelBorder; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getSearchPanelColor
	 *
	 * DESC: TODO
	 */
	public static Color getSearchPanelColor() { return searchPanelColor; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getComboBoxDiplayValue
	 *
	 * DESC: TODO
	 */
	public static List<String> getComboBoxDiplayValue() { return comboBoxDiplayValue; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getListStringSelectAll
	 *
	 * DESC: TODO
	 */
	public static List<String> getListStringSelectAll() { return listStringSelectAll; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getDisplayValue
	 *
	 * DESC: TODO
	 */
	public static String getDisplayValue() { return displayValue; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getMinYear
	 *
	 * DESC: TODO
	 */
	public static Integer getMinYear() { return minYear; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getMinAge
	 *
	 * DESC: TODO
	 */
	public static Integer getMinAge() { return minAge; }

	/**
	 * TYPE : static method - gui package
	 * NAME : getMaxAge
	 *
	 * DESC: TODO
	 */
	public static Integer getMaxAge() { return maxAge; }


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


	/**
	 * TYPE : static method - gui package
	 * NAME : fillCountryComboBox
	 *
	 * DESC: TODO
	 */
	public static void fillCountryComboBox(JComboBox<String> comboBox,
											Vector<String> vector,
											Map<String, String> map,
											String type,
											String superCountryID,
										   	Boolean selectAll)
	{

		GuiConfiguration.initComboBoxVector(vector, map, selectAll);

		Controller.getInstance().setCountryComboBox
			(
				vector,
				map,
				type,
				superCountryID
			);

		comboBox.setModel(new DefaultComboBoxModel<>(vector));
	}


	/**
	 * TYPE : static method - gui package
	 * NAME : fillYearComboBox
	 *
	 * DESC: TODO
	 */
	public static void fillYearComboBox(JComboBox<String> comboBox, Integer minimumYear)
	{
		Integer maximumYear = Year.now().getValue();

		for( Integer i = maximumYear; i >= minimumYear; --i){
			comboBox.addItem(i.toString());
		}

	}

}
