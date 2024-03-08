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
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.Map;
import java.util.Vector;

public class AdminViewAddPrize
				extends JPanel
{
	public AdminViewAddPrize(String teamID,String teamType)
	{
		final JLabel ctrlYear = new JLabel((String) null);
		final JLabel ctrlPrize = new JLabel((String) null);

		final Map<String, String> infoTeamMap = new LinkedHashMap<>();

		final Vector<String> prizeNameVector = new Vector<>();
		final Map<String, String> prizeNameMap = new HashMap<>();

		Controller.getInstance().setTeamInfoMap(teamID, infoTeamMap);


		MigLayout migLayout;
		AdminTopViewTeam adminTopViewTeam;
		TitleLabel titleLabel;
		LabelComboPanel yearPanel;
		LabelComboPanel prizeNamePanel;
		JButton confirmButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_FILL_SIZE_70P_LAYOUT_CONSTRAINT,
						GuiConfiguration.SIX_CELL_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewTeam = new AdminTopViewTeam(teamID, teamType);

		this.add(adminTopViewTeam);
		adminTopViewTeam.setGeneralInfoPanel(infoTeamMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("addPrize"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		yearPanel = new LabelComboPanel(
						GuiConfiguration.getMessage("year"),
						true,
						ctrlYear
		);
		this.add(yearPanel);
		/*------------------------------------------------------------------------------------------------------*/

		prizeNamePanel = new LabelComboPanel(
						GuiConfiguration.getMessage("prize"),
						false,
						ctrlPrize
		);
		this.add(prizeNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setCursor(GuiConfiguration.HAND_CURSOR);
		confirmButton.setEnabled(false);

		this.add(confirmButton);

		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				JOptionPane.showConfirmDialog(null, "SEI SICURO DI VOLER AGGIUNGERE IL PREMIO"); //TODO

				String message = Controller.getInstance().assignPrizeTeam(
								teamID,
								prizeNameMap.get(ctrlPrize.getText()),
								ctrlYear.getText()
				);

				System.out.println(message);

				try {
					JPanel panel = new AdminViewAddPrize(teamID, teamType);

					AdminViewAddPrize.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewAddPrize.this);

					MainFrame.getMainFrameInstance().getContentPane().add(panel, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
					panel.setVisible(true);
				} catch (Exception ex) {
					System.out.println("ERRORE: " + ex.getMessage());
				}
			}
		});

		ctrlYear.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlYear.getText(), "@fill")) {

					MyComboBox yearCombo = yearPanel.getMyComboBox();
					int dYear = Year.now().getValue();

					yearCombo.removeAllItems();

					for (int i = GuiConfiguration.MIN_YEAR; i < dYear;  ++i) {
						yearCombo.addItem(String.valueOf(i));
					}
				} else {
					prizeNamePanel.getMyComboBox().setEnabled(null != ctrlYear.getText());
					prizeNamePanel.getMyComboBox().setSelectedIndex(-1);
					ctrlPrize.setText(null);
				}
			}
		});

		ctrlPrize.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				if (0 == StringUtils.compareIgnoreCase(ctrlPrize.getText(), "@fill")) {
					prizeNameVector.clear();
					prizeNameMap.clear();

					Controller.getInstance().setTeamPrizeComboBox(
									prizeNameVector,
									prizeNameMap
					);

					if (prizeNameVector.isEmpty()) {
						prizeNameVector.add(GuiConfiguration.getMessage("noData"));
					}
					prizeNamePanel.getMyComboBox().setModel(new DefaultComboBoxModel<>(prizeNameVector));
				} else {
					confirmButton.setEnabled(null != prizeNameMap.get(ctrlPrize.getText()));
				}
			}
		});

	}
}
