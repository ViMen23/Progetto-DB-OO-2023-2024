package gui;

import controller.Controller;
import model.Country;
import model.Player;
import model.Team;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.time.Year;
import java.util.*;

public class AdminViewPlayerAddClubMilitancy
				extends JPanel
{
	public AdminViewPlayerAddClubMilitancy(String playerID)
	{
		final JLabel ctrlContinentName = new JLabel((String) null);
		final JLabel ctrlNationName = new JLabel((String) null);
		final JLabel ctrlTeamName = new JLabel((String) null);
		final JLabel ctrlSeason = new JLabel((String) null);
		final JLabel ctrlMilitancyType = new JLabel((String) null);


		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<String> continentNameVector = new Vector<>();
		final Map<String, String> continentNameMap = new HashMap<>();

		final Vector<String> nationNameVector = new Vector<>();
		final Map<String, String> nationNameMap = new HashMap<>();

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		final Map<String, String> seasonMap = new HashMap<>();


		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		JPanel panel;
		JLabel label;
		LabelComboPanel continentNamePanel;
		LabelComboPanel nationNamePanel;
		LabelComboPanel teamNamePanel;
		LabelComboPanel seasonPanel;
		JPanel militancyTypePanel;
		ButtonGroup buttonGroup;
		JRadioButton firstPartRadioButton;
		JRadioButton secondPartRadioButton;
		JRadioButton fullRadioButton;
		JButton confirmButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL_LAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewPlayer = new AdminTopViewPlayer(playerID, this);

		this.add(adminTopViewPlayer);
		adminTopViewPlayer.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addClubMilitancy"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		continentNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("CONTINENT"),
						true,
						ctrlContinentName
		);
		this.add(continentNamePanel);

		nationNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("NATION"),
						false,
						ctrlNationName
		);
		this.add(nationNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		teamNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("team"),
						false,
						ctrlTeamName
		);

		this.add(teamNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		seasonPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("season"),
						false,
						ctrlSeason
		);

		this.add(seasonPanel);
		/*------------------------------------------------------------------------------------------------------*/

		migLayout = new MigLayout(
						null,
						GuiConfiguration.TWO_CELL_SIZE_20P_40P_EXT_GAP_PUSH_INT_GAP_5P_LAYOUT_CONSTRAINT,
						null
		);

		panel = new JPanel(migLayout);
		panel.setBackground(Color.white);

		this.add(panel);


		label = new JLabel(GuiConfiguration.getMessage("militancyType"));

		panel.add(label);

		migLayout = new MigLayout(
						GuiConfiguration.CENTER_LAYOUT_CONSTRAINT,
						GuiConfiguration.THREE_CELL_SIZE_20P_INT_GAP_10P_LAYOUT_CONSTRAINT,
						null
		);

		militancyTypePanel = new JPanel(migLayout);
		militancyTypePanel.setBackground(Color.white);

		panel.add(militancyTypePanel);

		buttonGroup = new ButtonGroup();

		firstPartRadioButton = new JRadioButton(GuiConfiguration.getMessage(Player.MILITANCY_TYPE.I_PART.toString()));
		firstPartRadioButton.setEnabled(false);
		buttonGroup.add(firstPartRadioButton);
		militancyTypePanel.add(firstPartRadioButton);

		secondPartRadioButton = new JRadioButton(GuiConfiguration.getMessage(Player.MILITANCY_TYPE.II_PART.toString()));
		secondPartRadioButton.setEnabled(false);
		buttonGroup.add(secondPartRadioButton);
		militancyTypePanel.add(secondPartRadioButton);

		fullRadioButton = new JRadioButton(GuiConfiguration.getMessage(Player.MILITANCY_TYPE.FULL.toString()));
		fullRadioButton.setEnabled(false);
		buttonGroup.add(fullRadioButton);
		militancyTypePanel.add(fullRadioButton);
		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				int chosenOption;

				chosenOption = JOptionPane.showConfirmDialog(null,
								GuiConfiguration.getMessage("msgConfirmData"),
								GuiConfiguration.getMessage("addClubMilitancy"),
								JOptionPane.YES_NO_OPTION
				);

				if (chosenOption == JOptionPane.YES_OPTION) {
					String message = Controller.getInstance().newMilitancy(
									playerID,
									teamNameMap.get(ctrlTeamName.getText()),
									Team.TEAM_TYPE.CLUB.toString(),
									seasonMap.get(ctrlSeason.getText()),
									ctrlMilitancyType.getText()
					);

					JOptionPane.showMessageDialog(null, GuiConfiguration.getMessage(message));
				}

				try {
					AdminViewPlayerAddClubMilitancy.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerAddClubMilitancy.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddClubMilitancy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		ctrlContinentName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlContinentName.getText(), "@fill")) {
					continentNameVector.clear();
					continentNameMap.clear();

					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.CONTINENT.toString(),
									null,
									continentNameVector,
									continentNameMap
					);

					if (continentNameVector.isEmpty()) {
						continentNameVector.add(GuiConfiguration.getMessage("noData"));
					}

					continentNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(continentNameVector));
				} else {
					nationNamePanel.getMyComboBox().setSelectedIndex(-1);
					nationNamePanel.getMyComboBox().setEnabled(continentNameMap.get(ctrlContinentName.getText()) != null);
					ctrlNationName.setText(null);
				}
			}
		});

		ctrlNationName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlNationName.getText(), "@fill")) {
					nationNameVector.clear();
					nationNameMap.clear();


					Controller.getInstance().setCountryComboBox(
									Country.COUNTRY_TYPE.NATION.toString(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameVector,
									nationNameMap
					);

					if (nationNameVector.isEmpty()) {
						nationNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					nationNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(nationNameVector));
				}
				else {
					teamNamePanel.getMyComboBox().setSelectedIndex(-1);
					teamNamePanel.getMyComboBox().setEnabled(nationNameMap.get(ctrlNationName.getText()) != null);
					ctrlTeamName.setText(null);
				}
			}
		});

		ctrlTeamName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlTeamName.getText(), "@fill")) {
					teamNameVector.clear();
					teamNameMap.clear();


					Controller.getInstance().setTeamComboBox(
									null,
									null,
									Team.TEAM_TYPE.CLUB.toString(),
									continentNameMap.get(ctrlContinentName.getText()),
									nationNameMap.get(ctrlNationName.getText()),
									teamNameVector,
									teamNameMap
					);

					if (teamNameVector.isEmpty()) {
						teamNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					teamNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(teamNameVector));
				}
				else {
					seasonPanel.getMyComboBox().setSelectedIndex(-1);
					seasonPanel.getMyComboBox().setEnabled(teamNameMap.get(ctrlTeamName.getText()) != null);
					ctrlSeason.setText(null);
				}
			}
		});


		ctrlSeason.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlSeason.getText(), "@fill")) {
					int minYear;
					int maxYear;

					String string;

					string = Controller.getInstance().setPlayerYear(playerID);

					String[] keyPart = string.split("@");

					minYear = Integer.parseInt(keyPart[0]);
					maxYear = Integer.parseInt(keyPart[1]);

					if (maxYear > Year.now().getValue()) {
						maxYear = Year.now().getValue();
					}

					MyComboBox seasonCombo = seasonPanel.getMyComboBox();

					seasonCombo.removeAllItems();
					seasonMap.clear();

					for (int i = maxYear; i >= minYear; --i) {
						string = String.valueOf(i);
						string += "/";
						string += String.valueOf(i + 1);

						seasonCombo.addItem(string);

						seasonMap.put(string, String.valueOf(i));
					}

					if (0 == seasonCombo.getItemCount() ) {
						seasonCombo.addItem(GuiConfiguration.getMessage("noData"));
					}
				}
				else {
					buttonGroup.clearSelection();

					boolean bool  = null != seasonMap.get(ctrlSeason.getText());

					firstPartRadioButton.setEnabled(bool);
					secondPartRadioButton.setEnabled(bool);
					fullRadioButton.setEnabled(bool);

					ctrlMilitancyType.setText(null);
					confirmButton.setEnabled(false);
				}
			}
		});

		firstPartRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				confirmButton.setEnabled(true);
				ctrlMilitancyType.setText(Player.MILITANCY_TYPE.I_PART.toString());
			}
		});

		secondPartRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				confirmButton.setEnabled(true);
				ctrlMilitancyType.setText(Player.MILITANCY_TYPE.II_PART.toString());
			}
		});

		fullRadioButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				confirmButton.setEnabled(true);
				ctrlMilitancyType.setText(Player.MILITANCY_TYPE.FULL.toString());
			}
		});
	}

}

