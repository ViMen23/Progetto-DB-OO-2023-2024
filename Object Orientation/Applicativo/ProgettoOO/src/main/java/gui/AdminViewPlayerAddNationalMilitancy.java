package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.time.Year;
import java.util.*;

public class AdminViewPlayerAddNationalMilitancy
				extends JPanel
{
	public AdminViewPlayerAddNationalMilitancy(String playerID)
	{
		final JLabel ctrlTeamName = new JLabel((String) null);
		final JLabel ctrlYear = new JLabel((String) null);

		final Map<String, String> infoPlayerMap = new LinkedHashMap<>();

		final Vector<String> teamNameVector = new Vector<>();
		final Map<String, String> teamNameMap = new HashMap<>();

		Controller.getInstance().setPlayerInfoMap(playerID, infoPlayerMap);

		MigLayout migLayout;
		AdminTopViewPlayer adminTopViewPlayer;
		TitleLabel titleLabel;
		LabelComboPanel teamNamePanel;
		LabelComboPanel yearPanel;
		JButton confirmButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_GROW_FILL_GAP_0_0_CELL,
						GuiConfiguration.ONE_CELL_GAP_0_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewPlayer = new AdminTopViewPlayer(playerID, this);

		this.add(adminTopViewPlayer);
		adminTopViewPlayer.setGeneralInfoPanel(infoPlayerMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addNationalMilitancy"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		teamNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("nationalTeam"),
						true,
						ctrlTeamName
		);

		this.add(teamNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		yearPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("year"),
						false,
						ctrlYear
		);

		this.add(yearPanel);
		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton, GuiConfiguration.TOP_GAP_10_ADD_CONSTRAINT);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "SEI SICURO DI AVER INSERITO I DATI CORRETTAMENTE"); //TODO

				//String message = Controller.getInstance().addPlayerTag(playerID, continentNameMap.get(ctrlTagName.getText()));

				//System.out.println(message);

				try {
					AdminViewPlayerAddNationalMilitancy.this.getParent().setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewPlayerAddNationalMilitancy.this.getParent());

					MainFrame.getMainFrameInstance().getContentPane().add(
									new AdminNavigationPanel(new AdminViewPlayerAddNationalMilitancy(playerID)),
									GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT
					);
				} catch(Exception ex) {
					System.err.println("ERRORE: " + ex.getMessage());
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


					Controller.getInstance().setNationalTeamComboBox(playerID,teamNameVector, teamNameMap);

					if (teamNameVector.isEmpty()) {
						teamNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					teamNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(teamNameVector));
				}
				else {
					yearPanel.getMyComboBox().setSelectedIndex(-1);
					yearPanel.getMyComboBox().setEnabled(teamNameMap.get(ctrlTeamName.getText()) != null);
					ctrlYear.setText(null);
				}
			}
		});


		ctrlYear.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlYear.getText(), "@fill")) {
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

					MyComboBox yearCombo = yearPanel.getMyComboBox();

					yearCombo.removeAllItems();

					for (int i = maxYear; i >= minYear; --i) {
						yearCombo.addItem(String.valueOf(i));
					}
				}
				else {
					confirmButton.setEnabled(null != ctrlYear.getText());
				}
			}
		});
	}

}

