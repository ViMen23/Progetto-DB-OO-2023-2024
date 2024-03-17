package gui;

import database.DatabaseConnection;

import javax.swing.*;
import java.awt.*;
import java.awt.font.TextAttribute;
import java.sql.SQLException;
import java.util.*;

/**
 * Classe che contenente la configurazione generale della gui e costanti.
 */
public class GuiConfiguration
{
	public static final int INPUT_COLUMN = 35;
	public static final int MIN_YEAR = 1860;
	public static final ImageIcon HOME_ICON = GuiConfiguration.createImageIcon("images/homy.png");
	public static final ImageIcon FILTER_ICON = GuiConfiguration.createImageIcon("images/filter.png");
	public static final ImageIcon DICE_ICON = GuiConfiguration.createImageIcon("images/dice5.png");
	public static final ImageIcon BIN_ICON = GuiConfiguration.createImageIcon("images/bin.png");

	public static final Cursor HAND_CURSOR = new Cursor(Cursor.HAND_CURSOR);

	public static final Vector<String> COUNTRY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> CONFEDERATION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> COMPETITION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_COMPETITION_EDITION_TABLE_COLUM_NAME = new Vector<>();
	public static final Vector<String> TEAM_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_SQUAD_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_PARTICIPATING_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_TEAM_PARTICIPATING_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_TEAM_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> TEAM_PRIZE_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_TEAM_PRIZE_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_POSITION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_PLAYER_POSITION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_NATIONALITY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_PLAYER_NATIONALITY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_TAG_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_PLAYER_TAG_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_STATISTIC_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_PLAYER_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> PLAYER_PRIZE_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> ADMIN_PLAYER_PRIZE_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> STATISTIC_TOTAL_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> STATISTIC_EDITION_TABLE_COLUMN_NAME = new Vector<>();
	public static final Vector<String> STATISTIC_TABLE_COLUMN_NAME = new Vector<>();


	public static final String VLAYOUT_CONSTRAINT = "flowy";
	public static final String VFILL_LAYOUT_CONSTRAINT = "flowy, fill";
	public static final String WRAP_2_LAYOUT_CONSTRAINT = "wrap 2";
	public static final String CENTER_WRAP_2_LAYOUT_CONSTRAINT = "center, wrap 2";
	public static final String CENTER_LAYOUT_CONSTRAINT = "center";
	public static final String CENTER_VLAYOUT_CONSTRAINT = "flowy, center";

	public static final String ONE_CELL_GAP_0_10_LAYOUT_CONSTRAINT = "0[]10";
	public static final String ONE_CELL_GAP_0_LAYOUT_CONSTRAINT = "0[]0";
	public static final String ONE_CELL_GAP_50_LAYOUT_CONSTRAINT = "50[]50";
	public static final String ONE_CELL_TOP_GAP_10_0_LAYOUT_CONSTRAINT = "10[top]0";
	public static final String ONE_CELL_GAP_14P_LAYOUT_CONSTRAINT = "14%[]14%";
	public static final String ONE_GROW_FILL_CELL_LAYOUT_CONSTRAINT = "[grow, fill]";
	public static final String ONE_GROW_FILL_GAP_0_0_CELL_LAYOUT_CONSTRAINT = "0[grow, fill]0";
	public static final String TWO_CELL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT = "0[]10[]0";
	public static final String TWO_CELL_EXT_GAP_0_INT_GAP_110_LAYOUT_CONSTRAINT = "0[]110[]0";
	public static final String TWO_CELL_FILL_SIZE_55P_INT_GAP_6P_LAYOUT_CONSTRAITN = "[55%, fill]6%[]";
	public static final String TWO_CELL_FILL_SIZE_59P_35P_INT_GAP_50_LAYOUT_CONSTRAINT = "20[59%, fill]50[35%, fill]20";
	public static final String TWO_CELL_FILL_SIZE_20P_30P_EXT_GAP_5P_LAYOUT_CONSTRAINT = "5%[20%][30%, fill]5%";
	public static final String TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT = "5%[20%]10:push[60%, fill]5%";
	public static final String TWO_CELL_GROW_FILL_EXT_GAP_0_INT_GAP_10_LAYOUT_CONSTRAINT = "0[grow, fill]10[grow, fill]0";
	public static final String TWO_CELL_SIZE_15P_INT_GAP_150_LAYOUT_CONSTRAINT = "[15%, fill]150[15%, fill]";
	public static final String THREE_CELL_EXT_GAP_10_0_LAYOUT_CONSTRAINT = "10[][][]";
	public static final String THREE_CELL_EXT_GAP_0_INT_GAP_10_0_LAYOUT_CONSTRAINT = "0[]10[]0[]0";
	public static final String THREE_CELL_EXT_GAP_0_INT_GAP_0_10_LAYOUT_CONSTRAINT = "0[]0[][]0";
	public static final String THREE_CELL_EXT_GAP_PUSH_PUSH_INT_GAP_20_20_LAYOUT_CONSTRAINT = "20:push[]20[]20[]20:push";
	public static final String THREE_CELL_SIZE_20P_INT_GAP_10P_LAYOUT_CONSTRAINT = "[20%]10%[20%]10%[20%]";
	public static final String THREE_CELL_EXT_GAP_5P_INT_GAP_50P_5P_LAYOUT_CONSTRAINT = "5%[]50%[]5%[]5%";
	public static final String FOUR_CELL_SIZE_15P_GAP_8P_LAYOUT_CONSTRAINT = "8%[15%]8%[15%]8%[15%]8%[15%]8%";
	public static final String FOUR_CELL_EXT_GAP_2P_INT_GAP_5P_5P_3P_LAYOUT_CONSTRAINT = "2%[]5%[]5%[]3%[]2%";
	public static final String FIVE_CELL_LAYOUT_CONSTRAINT = "0[]0[fill]10[]0[fill]20[]0";
	public static final String SEVEN_CELL_LAYOUT_CONSTRAINT = "0[]0[fill][]0[fill][]0[fill]20[]0";
	public static final String NINE_CELL_LAYOUT_CONSTRAINT = "0[]0[fill][]0[fill][]0[fill][]0[fill]20[]0";
	public static final String THIRTEEN_CELL_LAYOUT_CONSTRAINT = "0[]0[fill][]0[fill][]0[fill][]0[fill][]0[fill][]0[fill]20[]0";

	public static final String HGROUP_FRAME_ADD_CONSTRAINT = "sgx frame";
	public static final String HGROUP_FRAME_VGROW_ADD_CONSTRAINT = "sgx frame, growy";
	public static final String HGROUP_GENERAL_DOCK_NORTH_ADD_CONSTRAINT = "sgx general, dock north";
	public static final String HGROUP_GENERAL_DOCK_CENTER_ADD_CONSTRAINT = "sgx general, dock center";
	public static final String HGROUP_GENERAL_DOCK_SOUTH_ADD_CONSTRAINT = "sgx general, dock south";
	public static final String HGROUP_FIRST_COLUMN_ADD_CONSTRAINT = "sgx first_column";
	public static final String HGROUP_FIRST_COLUMN_VSPLIT_TWO_BGAP_0_ADD_CONSTRAINT = "sgx first_column, split 2, flowy, gap bottom 0";
	public static final String HGROUP_FIRST_COLUMN_VSPLIT_THREE_BGAP_0_ADD_CONSTRAINT = "sgx first_column, split 3, flowy, gap bottom 0";
	public static final String HGROUP_FIRST_COLUMN_BGAP_0_ADD_CONSTRAINT = "sgx first_column, gap bottom 0";
	public static final String HGROUP_SECOND_COLUMN_ADD_CONSTRAINT = "sgx second_column";
	public static final String HGROUP_ADD_CONSTRAINT = "sgx";
	public static final String WIDTH_80P_ADD_CONSTRAINT = "width 80%";
	public static final String SPAN_2_ADD_CONSTRAINT = "span 2";
	public static final String TRAILING_ADD_CONSTRAINT = "trailing";
	public static final String TOP_GAP_10_ADD_CONSTRAINT = "gap top 10";

	private static ResourceBundle currentResourceBundle;

	public static Font outputFont;
	public static  Font outputBoldFont;
	public static Font outputSmallFont;
	public static Font outputRedFont;


	public static void initGuiConfiguration()
	{
		// creazione del locale di default come italiano
		setLocale(Locale.of("it", "IT"));

		initUIManager();
		initHomeFrame();
		initTableColumn();
		try {
			DatabaseConnection.getInstance();
		} catch (SQLException e) {
			System.out.println("ERRORE: " + e.getMessage());
		}
	}

	public static void initHomeFrame()
	{
		JFrame mainFrame = MainFrame.getMainFrameInstance();
		TopPanel topPanel = new TopPanel();
		mainFrame.add(topPanel, HGROUP_FRAME_ADD_CONSTRAINT);
		MenuBarPanel menuBarPanel = new MenuBarPanel(new StepFilterPanel());
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

		outputFont = new JPanel().getFont().deriveFont(18F);
		outputBoldFont = outputFont.deriveFont(Font.BOLD);
		outputSmallFont = outputFont.deriveFont(13F);

		Map<TextAttribute, Object> attribute = new HashMap<>();
		attribute.put(TextAttribute.FOREGROUND, Color.red);

		outputRedFont = outputFont.deriveFont(attribute);

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
		UIManager.put("Label.font", outputFont);
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
		UIManager.put("TextField[Disabled].backgroundPainter", UIManager.get("TextField[Enabled].backgroundPainter"));
		UIManager.put("TextField[Disabled].borderPainter", UIManager.get("TextField[Enabled].borderPainter"));

		//configurazioni field password
		UIManager.put("PasswordField.font", outputFont);
		UIManager.put("PasswordField.echoChar", '⚫');

		//configurazioni table
		UIManager.put("Table.font", outputFont);
		UIManager.put("Table.textForeground", Color.black);

		//configurazione intestazione tabella
		UIManager.put("TableHeader.font", outputBoldFont);
		UIManager.put("TableHeader.textForeground", Color.white);

		//configurazione text field
		UIManager.put("TextArea.font", outputFont);
	}
	public static void initCountryTableColumnName()
	{
		COUNTRY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
		COUNTRY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("code"));
		COUNTRY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type").toUpperCase());
		COUNTRY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("superCountry"));
	}

	public static void initConfederationTableColumnName()
	{
		CONFEDERATION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("confederation"));
		CONFEDERATION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("code"));
		CONFEDERATION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type").toUpperCase());
		CONFEDERATION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
		CONFEDERATION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("superConfederation"));
	}

	public static void initCompetitionTableColumnName()
	{
		COMPETITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		COMPETITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type").toUpperCase());
		COMPETITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("teamType"));
		COMPETITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("confederation"));
		COMPETITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
	}

	public static void initCompetitionEditionTableColumnName()
	{
		ADMIN_COMPETITION_EDITION_TABLE_COLUM_NAME.add(GuiConfiguration.getMessage("select"));
		ADMIN_COMPETITION_EDITION_TABLE_COLUM_NAME.add(GuiConfiguration.getMessage("year").toUpperCase());
	}
	public static void initTeamTableColumnName()
	{
		TEAM_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		TEAM_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("code"));
		TEAM_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type").toUpperCase());
		TEAM_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
	}

	public static void initTeamSquadTableColumnName()
	{
		TEAM_SQUAD_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("role"));
		TEAM_SQUAD_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("name").toUpperCase());
		TEAM_SQUAD_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("surname").toUpperCase());
	}
	public static void initTeamParticipantTableColumnName()
	{
		ADMIN_TEAM_PARTICIPATING_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("select"));

		TEAM_PARTICIPATING_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		TEAM_PARTICIPATING_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type").toUpperCase());
		TEAM_PARTICIPATING_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("confederation"));

		ADMIN_TEAM_PARTICIPATING_TABLE_COLUMN_NAME.addAll(TEAM_PARTICIPATING_TABLE_COLUMN_NAME);
	}

	public static void initTeamTrophyTableColumnName()
	{
		ADMIN_TEAM_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("select"));

		TEAM_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		TEAM_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		TEAM_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("trophy").toUpperCase());

		ADMIN_TEAM_TROPHY_TABLE_COLUMN_NAME.addAll(TEAM_TROPHY_TABLE_COLUMN_NAME);
	}

	public static void initTeamPrizeTableColumnName()
	{
		ADMIN_TEAM_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("select"));

		TEAM_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		TEAM_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("prize").toUpperCase());
		TEAM_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("given"));

		ADMIN_TEAM_PRIZE_TABLE_COLUMN_NAME.addAll(TEAM_PRIZE_TABLE_COLUMN_NAME);
	}

	public static void initPlayerTableColumnName()
	{
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("surname").toUpperCase());
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("name").toUpperCase());
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("dob").toUpperCase());
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("foot").toUpperCase());
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("role"));
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("position").toUpperCase());
		PLAYER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("retiredDate").toUpperCase());
	}

	public static void initPlayerPositionTableColumnName()
	{
		ADMIN_PLAYER_POSITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("select"));

		PLAYER_POSITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("role"));
		PLAYER_POSITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("code"));
		PLAYER_POSITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("position"));

		ADMIN_PLAYER_POSITION_TABLE_COLUMN_NAME.addAll(PLAYER_POSITION_TABLE_COLUMN_NAME);
	}

	public static void initPlayerNationalityTableColumnName()
	{
		ADMIN_PLAYER_NATIONALITY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("select"));

		PLAYER_NATIONALITY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));

		ADMIN_PLAYER_NATIONALITY_TABLE_COLUMN_NAME.addAll(PLAYER_NATIONALITY_TABLE_COLUMN_NAME);
	}

	public static void initPlayerAttributeTableColumnName()
	{
		String string;

		string = GuiConfiguration.getMessage("attribute");
		PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME.add(string);

		string = GuiConfiguration.getMessage("value");
		PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME.add(string);
		PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME.add(string);
	}

	public static void initPlayerTagTableColumnName()
	{
		ADMIN_PLAYER_TAG_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("select"));

		PLAYER_TAG_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("tag").toUpperCase());

		ADMIN_PLAYER_TAG_TABLE_COLUMN_NAME.addAll(PLAYER_TAG_TABLE_COLUMN_NAME);
	}

	public static void initPlayerClubCareerTableColumnName()
	{
		ADMIN_PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("select"));

		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("type").toUpperCase());
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("country"));

		ADMIN_PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.addAll(PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME);
	}

	public static void initPlayerNationalityCareerTableColumnName()
	{
		ADMIN_PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("select"));

		PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());

		ADMIN_PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME.addAll(PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME);
	}

	public static void initPlayerStatisticTableColumnName()
	{
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("match").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalScored").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltyScored").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("assist").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("yellowCard").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("redCard").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalConceded").toUpperCase());
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltySaved").toUpperCase());
	}

	public static void initPlayerClubTrophyTableColumnName()
	{
		ADMIN_PLAYER_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("select"));

		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("trophy").toUpperCase());

		ADMIN_PLAYER_TROPHY_TABLE_COLUMN_NAME.addAll(PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME);
	}

	public static void initPlayerNationalTrophyTableColumnName()
	{
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("trophy").toUpperCase());
	}

	public static void initPlayerPrizeTableColumnName()
	{
		ADMIN_PLAYER_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("select"));

		PLAYER_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		PLAYER_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("prize").toUpperCase());
		PLAYER_PRIZE_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("given"));

		ADMIN_PLAYER_PRIZE_TABLE_COLUMN_NAME.addAll(PLAYER_PRIZE_TABLE_COLUMN_NAME);
	}

	public static void initStatisticTotalTableColumnName()
	{
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("role"));
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("name").toUpperCase());
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("surname").toUpperCase());
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("match").toUpperCase());
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalScored").toUpperCase());
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltyScored").toUpperCase());
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("assist").toUpperCase());
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("yellowCard").toUpperCase());
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("redCard").toUpperCase());
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalConceded").toUpperCase());
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltySaved").toUpperCase());
	}
	public static void initStatisticEditionTableColumnName()
	{
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("role"));
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("name").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("surname").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("match").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalScored").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltyScored").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("assist").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("yellowCard").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("redCard").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalConceded").toUpperCase());
		STATISTIC_EDITION_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltySaved").toUpperCase());

	}
	public static void initStatisticTableColumnNameTableColumnName()
	{
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("season").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("competition").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("team").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("match").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalScored").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltyScored").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("assist").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("yellowCard").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("redCard").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("goalConceded").toUpperCase());
		STATISTIC_TABLE_COLUMN_NAME.add(GuiConfiguration.getMessage("penaltySaved").toUpperCase());
	}

	public static void initTableColumn()
	{
		initCountryTableColumnName();
		initConfederationTableColumnName();
		initCompetitionTableColumnName();
		initCompetitionEditionTableColumnName();
		initTeamTableColumnName();
		initTeamSquadTableColumnName();
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

	public static void resetTableColumn()
	{
		COUNTRY_TABLE_COLUMN_NAME.clear();
		CONFEDERATION_TABLE_COLUMN_NAME.clear();
		COMPETITION_TABLE_COLUMN_NAME.clear();
		ADMIN_COMPETITION_EDITION_TABLE_COLUM_NAME.clear();
		TEAM_TABLE_COLUMN_NAME.clear();
		TEAM_SQUAD_TABLE_COLUMN_NAME.clear();
		TEAM_PARTICIPATING_TABLE_COLUMN_NAME.clear();
		ADMIN_TEAM_PARTICIPATING_TABLE_COLUMN_NAME.clear();
		PLAYER_TABLE_COLUMN_NAME.clear();
		TEAM_TROPHY_TABLE_COLUMN_NAME.clear();
		ADMIN_TEAM_TROPHY_TABLE_COLUMN_NAME.clear();
		TEAM_PRIZE_TABLE_COLUMN_NAME.clear();
		ADMIN_TEAM_PRIZE_TABLE_COLUMN_NAME.clear();
		PLAYER_POSITION_TABLE_COLUMN_NAME.clear();
		ADMIN_PLAYER_POSITION_TABLE_COLUMN_NAME.clear();
		PLAYER_NATIONALITY_TABLE_COLUMN_NAME.clear();
		ADMIN_PLAYER_NATIONALITY_TABLE_COLUMN_NAME.clear();
		PLAYER_ATTRIBUTE_GOALKEEPING_TABLE_COLUMN_NAME.clear();
		PLAYER_ATTRIBUTE_MENTAL_TABLE_COLUMN_NAME.clear();
		PLAYER_ATTRIBUTE_PHYSICAL_TABLE_COLUMN_NAME.clear();
		PLAYER_ATTRIBUTE_TECHNICAL_TABLE_COLUMN_NAME.clear();
		PLAYER_TAG_TABLE_COLUMN_NAME.clear();
		ADMIN_PLAYER_TAG_TABLE_COLUMN_NAME.clear();
		PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.clear();
		ADMIN_PLAYER_CLUB_CAREER_TABLE_COLUMN_NAME.clear();
		PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME.clear();
		ADMIN_PLAYER_NATIONAL_CAREER_TABLE_COLUMN_NAME.clear();
		PLAYER_STATISTIC_TABLE_COLUMN_NAME.clear();
		PLAYER_CLUB_TROPHY_TABLE_COLUMN_NAME.clear();
		ADMIN_PLAYER_TROPHY_TABLE_COLUMN_NAME.clear();
		PLAYER_NATIONAL_TROPHY_TABLE_COLUMN_NAME.clear();
		PLAYER_PRIZE_TABLE_COLUMN_NAME.clear();
		ADMIN_PLAYER_PRIZE_TABLE_COLUMN_NAME.clear();
		STATISTIC_TOTAL_TABLE_COLUMN_NAME.clear();
		STATISTIC_EDITION_TABLE_COLUMN_NAME.clear();
		STATISTIC_TABLE_COLUMN_NAME.clear();
	}

	public static void setLocale(Locale locale)
	{
		Locale.setDefault(locale);
		setResourceBundle(locale);
	}


	public static String getMessage(String key)
	{
		try {
			return currentResourceBundle.getString(key);
		} catch(Exception e) {
			System.err.println("Errore: " + e.getMessage());
			return "";
		}
	}

	public static boolean setResourceBundle(Locale locale)
	{
		try {
			currentResourceBundle = ResourceBundle.getBundle("guiBundle", locale);
		} catch (MissingResourceException e) {
			System.out.println(e.getMessage());
			return false;
		}

		return true;
	}

	public static ImageIcon createImageIcon(String imagePath)
	{
		return createImageIcon(imagePath, 30, 30);
	}


	public static ImageIcon createImageIcon(String imagePath,
																					int width,
																					int height)
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
