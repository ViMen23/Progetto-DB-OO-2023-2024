package gui;

import javax.swing.*;

import java.awt.*;

import java.util.*;

/**
 * TYPE : class - gui package
 * NAME : GuiConfiguration
 * DESC: TODO
 */
public class GuiConfiguration
{
	public static final int INPUT_COLUMN = 35;
	public static final int MIN_YEAR = 1810;
	public static final int MIN_AGE = 15;
	public static final int MAX_AGE = 50;

	public static final Cursor HAND_CURSOR = new Cursor(Cursor.HAND_CURSOR);

	public static final Vector<String> COUNTRY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> CONFEDERATION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> COMPETITION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_PARTICIPATING_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_PRIZE_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_POSITION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_NATIONALITY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_TAG_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_STATISTIC_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_PRIZE_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> STATISTIC_TOTAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> STATISTIC_EDITION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> STATISTIC_TABLE_COLUMN_NAME = new Vector<>();


	public static final String DEBUG_LAYOUT_CONSTRAINT = "debug";
	public static final String VLAYOUT_CONSTRAINT = "debug, flowy";
	public static final String VFILL_LAYOUT_CONSTRAINT = "debug, flowy, fill";
	public static final String DEBUG_WRAP_2_LAYOUT_CONSTRAINT = "debug, wrap 2";
	public static final String CENTER_LAYOUT_CONSTRAINT = "debug, center";

	public static final String ONE_CELL_LAYOUT_CONSTRAINT = "[]";
	public static final String ONE_CELL_GAP_0_10 = "0[]";
	public static final String ONE_CELL_GAP_0_LAYOUT_CONSTRAINT = "0[]0";
	public static final String ONE_GROW_FILL_CELL = "[grow, fill]";
	public static final String TWO_CELL_LAYOUT_CONSTRAINT = "[][]";
	public static final String TWO_CELL_EXT_GAP_0_INT_GAP_110_LAYOUT_CONSTRAINT = "0[]110[]0";
	public static final String TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT = "20[59%, fill]50[35%, fill]20";
	public static final String TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT = "5%[20%]10:push[40%]5%";
	public static final String THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT = "10[][][]";
	public static final String THREE_CELL_SIZE_20P_INT_GAP_10P_LAYOUT_CONSTRAINT = "[20%]10%[20%]10%[20%]";
	public static final String FOUR_CELL_SIZE_15P_GAP_8P = "8%[15%]8%[15%]8%[15%]8%[15%]8%";
	public static final String FIVE_CELL_LAYOUT_CONSTRAINT = "0[]0[fill]10[]0[fill]20[]0";
	public static final String SEVEN_CELL_LAYOUT_CONSTRAINT = "0[]0[fill][]0[fill][]0[fill]20[]0";
	public static final String NINE_CELL_LAYOUT_CONSTRAINT = "0[]0[fill][]0[fill][]0[fill][]0[fill]20[]0";
	public static final String THIRTEEN_CELL_LAYOUT_CONSTRAINT = "0[]0[fill][]0[fill][]0[fill][]0[fill][]0[fill][]0[fill]20[]0";

	public static final String HGROUP_FRAME_ADD_CONSTRAINT = "sgx frame";
	public static final String HGROUP_FRAME_VGROW_ADD_CONSTRAINT = "sgx frame, growy";
	public static final String HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT = "sgx general, dock north";
	public static final String HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT = "sgx general, dock center,";
	public static final String HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT = "sgx general, dock south";
	public static final String HGROUP_FIRST_COLUMN_ADD_CONSTRAINT = "sgx first_column";
	public static final String HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT = "sgx first_column, split 2, flowy, gap bottom 0";
	public static final String HGROUP_FIRST_COLUMN_VSPLIT_THREE_BGAP_0_ADD_CONSTRAINT = "sgx first_column, split 3, flowy, gap bottom 0";
	public static final String HGROUP_FIRST_COLUMN_BGAP_0_ADD_CONSTRAINT = "sgx first_column, gap bottom 0";
	public static final String HGROUP_SECOND_COLUMN_ADD_CONSTRAINT = "sgx second_column";
	public static final String WIDTH_80P_ADD_CONSTRAINT = "width 80%";
	public static final String SPAN_2_ADD_CONSTRAINT = "span 2";

	private static ResourceBundle currentResourceBundle;

	public static Font OUTPUT_FONT;
	public static  Font OUTPUT_BOLD_FONT;
	public static Font OUTPUT_SMALL_FONT;


	/**
	 * TYPE : static method - gui package
	 * NAME : initGuiConfiguration
	 * DESC: TODO
	 */
	public static void initGuiConfiguration()
	{
		// creazione del locale di default come italiano
		setLocale(Locale.of("it", "IT"));

		initUIManager();
		initHomeFrame();
		initTableColumn();
	}

	public static void initHomeFrame()
	{
		JFrame mainFrame = MainFrame.getMainFrameInstance();

		TopPanel topPanel = new TopPanel();

		mainFrame.add(topPanel, HGROUP_FRAME_ADD_CONSTRAINT);

		MenuBarPanel menuBarPanel = new MenuBarPanel();

		mainFrame.add(menuBarPanel, HGROUP_FRAME_ADD_CONSTRAINT);

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

		OUTPUT_FONT = new JPanel().getFont().deriveFont(18F);
		OUTPUT_BOLD_FONT = OUTPUT_FONT.deriveFont(Font.BOLD);
		OUTPUT_SMALL_FONT = OUTPUT_FONT.deriveFont(13F);

		//Configurazioni generali
		UIManager.put("nimbusBase", new Color(130, 130, 130));
		UIManager.put("nimbusBlueGrey", new Color(50, 100, 150));
		UIManager.put("control", new Color(230, 230, 230));


		//Configurazioni bottone
		UIManager.put("Button.font", OUTPUT_FONT);
		UIManager.put("Button.textForeground", Color.white);

		//Configurazioni checkBox
		UIManager.put("CheckBox.background", Color.green);
		UIManager.put("CheckBox.font", OUTPUT_FONT);

		//Configurazioni comboBox
		UIManager.put("ComboBox.font", OUTPUT_FONT);
		UIManager.put("ComboBox.foreground", Color.white);

		//Configurazioni radioButton
		UIManager.put("RadioButton.background", Color.green);
		UIManager.put("RadioButton.font", OUTPUT_FONT);
		UIManager.put("RadioButton.foreground", Color.white);

		//Configurazioni label
		UIManager.put("Label.font", OUTPUT_FONT);
		UIManager.put("Label[Enabled].textForeground", Color.black);

		//configurazioni menu
		UIManager.put("Menu.font", OUTPUT_FONT);
		UIManager.put("Menu[Enabled].textForeground", Color.white);

		//configurazioni menuItem
		UIManager.put("MenuItem.font", OUTPUT_SMALL_FONT);

		//configurazioni panel
		UIManager.put("Panel.font", OUTPUT_FONT);

		// configurazioni text field
		UIManager.put("TextField.font", OUTPUT_FONT);

		//configurazioni field password
		UIManager.put("PasswordField.font", OUTPUT_FONT);
		UIManager.put("PasswordField.echoChar", '⚫');

		//configurazioni table
		UIManager.put("Table.font", OUTPUT_FONT);
		UIManager.put("Table.textForeground", Color.black);

		//configurazione intestazione tabella
		UIManager.put("TableHeader.font", OUTPUT_BOLD_FONT);
		UIManager.put("TableHeader.textForeground", Color.white);

		//configurazione text field
		UIManager.put("TextArea.font", OUTPUT_FONT);
	}

	public static void initCountryTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		COUNTRY_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("code");
		string = string.toUpperCase();
		COUNTRY_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		COUNTRY_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("superCountry");
		string = string.toUpperCase();
		COUNTRY_TABLE_COLUMN_NAME.add(string);
	}

	public static void initConfederationTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();
		CONFEDERATION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("code");
		string = string.toUpperCase();
		CONFEDERATION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		CONFEDERATION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		CONFEDERATION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("superConfederation");
		string = string.toUpperCase();
		CONFEDERATION_TABLE_COLUMN_NAME.add(string);
	}

	public static void initCompetitionTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		COMPETITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		COMPETITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("teamType");
		string = string.toUpperCase();
		COMPETITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();
		COMPETITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		COMPETITION_TABLE_COLUMN_NAME.add(string);
	}

	public static void initTeamTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		TEAM_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("code");
		string = string.toUpperCase();
		TEAM_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		TEAM_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		TEAM_TABLE_COLUMN_NAME.add(string);

	}

	public static void initTeamParticipantTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		TEAM_PARTICIPATING_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		TEAM_PARTICIPATING_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("confederation");
		string = string.toUpperCase();
		TEAM_PARTICIPATING_TABLE_COLUMN_NAME.add(string);
	}

	public static void initTeamTrophyTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		TEAM_TROPHY_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("trophy");
		string = string.toUpperCase();
		TEAM_TROPHY_TABLE_COLUMN_NAME.add(string);

	}

	public static void initTeamPrizeTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("prize");
		string = string.toUpperCase();
		TEAM_PRIZE_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("given");
		string = string.toUpperCase();
		TEAM_PRIZE_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("surname");
		string = string.toUpperCase();
		PLAYER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("name");
		string = string.toUpperCase();
		PLAYER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("dob");
		string = string.toUpperCase();
		PLAYER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		PLAYER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("foot");
		string = string.toUpperCase();
		PLAYER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		PLAYER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("position");
		string = string.toUpperCase();
		PLAYER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("retiredDate");
		string = string.toUpperCase();
		PLAYER_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerPositionTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		PLAYER_POSITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("code");
		string = string.toUpperCase();
		PLAYER_POSITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("position");
		string = string.toUpperCase();
		PLAYER_POSITION_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerNationalityTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		PLAYER_NATIONALITY_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerAttributeTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("attribute");
		string = string.toUpperCase();
		PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("value");
		string = string.toUpperCase();
		PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerTagTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("tag");
		string = string.toUpperCase();
		PLAYER_TAG_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerClubCareerTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("type");
		string = string.toUpperCase();
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("country");
		string = string.toUpperCase();
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerNationalityCareerTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerStatisticTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("match");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("goalScored");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("penaltyScored");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("assist");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("yellowCard");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("redCard");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("goalConceded");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("penaltySaved");
		string = string.toUpperCase();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerClubTrophyTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("trophy");
		string = string.toUpperCase();
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerNationalTrophyTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("trophy");
		string = string.toUpperCase();
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerPrizeTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		PLAYER_PRIZE_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("prize");
		string = string.toUpperCase();
		PLAYER_PRIZE_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("given");
		string = string.toUpperCase();
		PLAYER_PRIZE_TABLE_COLUMN_NAME.add(string);
	}

	public static void initStatisticTotalTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("name");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("surname");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("match");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("goalScored");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("penaltyScored");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("assist");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("yellowCard");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("redCard");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("goalConceded");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("penaltySaved");
		string = string.toUpperCase();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(string);
	}
	public static void initStatisticEditionTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("role");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("name");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("surname");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("match");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("goalScored");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("penaltyScored");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("assist");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("yellowCard");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("redCard");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("goalConceded");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("penaltySaved");
		string = string.toUpperCase();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(string);

	}
	public static void initStatisticTableColumnNameTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("season");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("competition");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("team");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("match");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("goalScored");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("penaltyScored");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("assist");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("yellowCard");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("redCard");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("goalConceded");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("penaltySaved");
		string = string.toUpperCase();
		STATISTIC_TABLE_COLUMN_NAME.add(string);
	}

	public static void initTableColumn()
	{
		initCountryTableColumnName();
		initConfederationTableColumnName();
		initCompetitionTableColumnName();
		initTeamTableColumnName();
		initTeamParticipantTableColumnName();
		initTeamTrophyTableColumnName();
		initTeamPrizeTableColumnName();
		initPlayerTableColumnName();
		initPlayerPositionTableColumnName();
		initPlayerNationalityTableColumnName();
		initPlayerAttributeTableColumnName();
		initPlayerTagTableColumnName();
		initPlayerClubCareerTableColumnName();
		initPlayerNationalityCareerTableColumnName();
		initPlayerStatisticTableColumnName();
		initPlayerClubTrophyTableColumnName();
		initPlayerNationalTrophyTableColumnName();
		initPlayerPrizeTableColumnName();
		initStatisticTotalTableColumnName();
		initStatisticEditionTableColumnName();
		initStatisticTableColumnNameTableColumnName();
	}

	public static void setLocale(Locale locale)
	{
		Locale.setDefault(locale);
		setResourceBundle(locale);
	}


	/**
	 * TYPE : static method - gui package
	 * NAME : getMessage
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
	 * NAME : setResourceBundle
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
	 * DESC: TODO
	 */
	public static ImageIcon createImageIcon(String imagePath) { return createImageIcon(imagePath, 30, 30); }


	/**
	 * TYPE : static method - gui package
	 * NAME : createImageIcon
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
	 *
	 * @param container
	 * @param panelToAdd
	 * @param index
	 * @param constraint
	 */
	public static void switchPanel(Container container, JPanel panelToAdd, Integer index, String constraint)
	{
		Component component = container.getComponent(index);

		component.setVisible(false);

		container.remove(component);

		container.add(panelToAdd, constraint);

		panelToAdd.setVisible(true);
	}



}
