package gui;

import controller.Controller;
import model.Country;
import model.Player;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.HashMap;
import java.util.Map;
import java.util.Vector;

public class SearchPlayerPanel
							extends JPanel
{

	public TopSearchPanel topSearchPanel;
	public SearchPlayerPanel()
	{
		final String selectAll = StringUtils.capitalize(GuiConfiguration.getMessage("selectAll"));

		final JLabel ctrlPlayerSubName = new JLabel((String) null);
		final JLabel ctrlPlayerSubSurname = new JLabel((String) null);
		final JLabel ctrlReferenceYear = new JLabel((String) null);
		final JLabel ctrlPlayerMinAge = new JLabel((String) null);
		final JLabel ctrlPlayerMaxAge = new JLabel((String) null);
		final JLabel ctrlContinentName = new JLabel(selectAll);
		final JLabel ctrlNationName = new JLabel(selectAll);
		final JLabel ctrlPlayerRole = new JLabel((String) null);
		final JLabel ctrlPlayerPosition = new JLabel(selectAll);
		final JLabel ctrlPlayerFoot = new JLabel((String) null);

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> positionNameVector = new Vector<>();
		final Map<String, String> positionNameMap = new HashMap<>();


		final Vector<Vector<String>> playerTableData = new Vector<>();

		MigLayout migLayout;
		InfoPanel infoPanel;
		TitleLabel titleLabel;
		LabelTextPanel playerNamePanel;
		LabelTextPanel playerSurnamePanel;
		LabelComboPanel referringYearPanel;
		LabelComboPanel playerMinAgePanel;
		LabelComboPanel playerMaxAgePanel;
		LabelComboPanel continentTypeNamePanel;
		LabelComboPanel nationTypeNamePanel;
		PlayerRoleCheckPanel playerRolePanel;
		LabelComboPanel playerPositionPanel;
		RadioPanel playerFootPanel;
		TablePanel playerTablePanel;
		JButton button;

		String string;

		migLayout = new MigLayout(
						GuiConfiguration.generalSearchPanelLayoutConstraint,
						GuiConfiguration.generalSearchPanelColumnConstraint,
						GuiConfiguration.generalSearchPanelRowConstraint
		);


		this.setLayout(migLayout);


		JPanel centralPanel = new JPanel();

		migLayout = new MigLayout(
						GuiConfiguration.middleSearchPanelLayoutConstraint,
						GuiConfiguration.middleSearchPanelColumnConstraint,
						"0[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]10[]0[fill]20[]0" //TODO
		);

		centralPanel.setLayout(migLayout);


		string = GuiConfiguration.getMessage("search");
		string += " ";
		string += GuiConfiguration.getMessage("players");
		string += " - ";
		string += GuiConfiguration.getMessage("players");
		string += " ";
		string += GuiConfiguration.getMessage("available");
		string += " ";
		string += Controller.getInstance().countPlayers().toString();
		string = string.toUpperCase();

		topSearchPanel = new TopSearchPanel(string, this, centralPanel);
		this.add(topSearchPanel, GuiConfiguration.topSearchPanelAddConstraint);

		this.add(centralPanel, GuiConfiguration.middleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("name");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);


		string = GuiConfiguration.getMessage("name");
		string = StringUtils.capitalize(string);

		playerNamePanel = new LabelTextPanel(string, ctrlPlayerSubName, Regex.patternString);
		centralPanel.add(playerNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", split 2, flowy, gap bottom 0"); //TODO

		string = GuiConfiguration.getMessage("shortName");
		string = StringUtils.capitalize(string);

		playerSurnamePanel = new LabelTextPanel(string, GuiConfiguration.panelToAddRowConstraint, ctrlPlayerSubSurname, Regex.patternString);
		centralPanel.add(playerSurnamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);


		infoPanel = new InfoPanel("Questo e' il primo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/


		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("age");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);


		string = GuiConfiguration.getMessage("referenceYear");
		string = StringUtils.capitalize(string);

		referringYearPanel = new LabelComboPanel(string, true, ctrlReferenceYear);
		centralPanel.add(referringYearPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", split 3, flowy, gap bottom 0"); //TODO

		string = GuiConfiguration.getMessage("minimumAge");
		string = StringUtils.capitalize(string);

		playerMinAgePanel = new LabelComboPanel(string, false,  GuiConfiguration.panelToAddRowConstraint, ctrlPlayerMinAge);
		centralPanel.add(playerMinAgePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", gap bottom 0"); //TODO

		string = GuiConfiguration.getMessage("maximumAge");
		string = StringUtils.capitalize(string);

		playerMaxAgePanel = new LabelComboPanel(string, false, GuiConfiguration.panelToAddRowConstraint, ctrlPlayerMaxAge);
		centralPanel.add(playerMaxAgePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il secondo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("bornNation");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		string = Country.COUNTRY_TYPE.CONTINENT.toString();
		string = string.toLowerCase();
		string = GuiConfiguration.getMessage(string);
		string = StringUtils.capitalize(string);

		continentTypeNamePanel = new LabelComboPanel(string, true, ctrlContinentName);
		centralPanel.add(continentTypeNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint + ", split 2, flowy, gap bottom 0"); //TODO

		string = Country.COUNTRY_TYPE.NATION.toString();
		string = string.toLowerCase();
		string = GuiConfiguration.getMessage(string);
		string = StringUtils.capitalize(string);

		nationTypeNamePanel = new LabelComboPanel(string, false, GuiConfiguration.panelToAddRowConstraint, ctrlNationName);
		centralPanel.add(nationTypeNamePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il terzo info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("role");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		playerRolePanel = new PlayerRoleCheckPanel(ctrlPlayerRole);
		centralPanel.add(playerRolePanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il quarto info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("mainPosition");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		string = GuiConfiguration.getMessage("position");
		string = StringUtils.capitalize(string);

		playerPositionPanel = new LabelComboPanel(string, true, ctrlPlayerPosition);
		centralPanel.add(playerPositionPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il quinto info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/

		string = GuiConfiguration.getMessage("searchBy");
		string += " ";
		string += GuiConfiguration.getMessage("preferredFoot");
		string = string.toUpperCase();

		titleLabel = new TitleLabel(string);
		centralPanel.add(titleLabel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		titleLabel = new TitleLabel("INFO"); //TODO i18n
		centralPanel.add(titleLabel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);

		playerFootPanel = new RadioPanel(Player.FOOT_TYPE.values(), ctrlPlayerFoot);
		centralPanel.add(playerFootPanel, GuiConfiguration.firstColumnMiddleSearchPanelAddConstraint);

		infoPanel = new InfoPanel("Questo e' il sesto info box");
		centralPanel.add(infoPanel, GuiConfiguration.secondColumnMiddleSearchPanelAddConstraint);
		/*------------------------------------------------------------------------------------------------------*/


		playerTablePanel = new TablePanel(true, null, null, null);
		this.add(playerTablePanel, GuiConfiguration.tablePanelAddConstraint);


		string = GuiConfiguration.getMessage("search");
		string = string.toUpperCase();

		button = new JButton(string);

		button.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String string;

				playerTableData.clear();

				Controller.getInstance().setPlayerTable(
								ctrlPlayerSubName.getText(),
								ctrlPlayerSubSurname.getText(),
								ctrlReferenceYear.getText(),
								ctrlPlayerMinAge.getText(),
								ctrlPlayerMaxAge.getText(),
								continentNameMap.get(ctrlContinentName.getText()),
								nationNameMap.get(ctrlNationName.getText()),
								ctrlPlayerRole.getText(),
								positionNameMap.get(ctrlPlayerPosition.getText()),
								ctrlPlayerFoot.getText(),
								playerTableData
				);

				playerTablePanel.fillTable(playerTableData, GuiConfiguration.playerTableColumnName);

				string = GuiConfiguration.getMessage("results");
				string += " ";
				string += GuiConfiguration.getMessage("players");
				string += " - ";
				string += playerTableData.size();
				string += " ";
				string += GuiConfiguration.getMessage("players");
				string = string.toUpperCase();

				playerTablePanel.setTextTitleLabel(string);

				SearchPlayerPanel.this.revalidate();
			}
		});

		centralPanel.add(button, GuiConfiguration.searchButtonAddConstraint);

	}
}
