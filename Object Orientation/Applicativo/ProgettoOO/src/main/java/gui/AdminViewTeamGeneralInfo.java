package gui;

import controller.Controller;
import net.miginfocom.swing.MigLayout;
import org.apache.commons.lang3.StringUtils;

import javax.swing.*;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyChangeEvent;
import java.beans.PropertyChangeListener;
import java.util.LinkedHashMap;
import java.util.Map;

public class AdminViewTeamGeneralInfo
				extends JPanel
{
	public AdminViewTeamGeneralInfo(String teamID, String teamType)
	{
		final JLabel ctrlLongName = new JLabel((String) null);
		final JLabel ctrlShortName = new JLabel((String) null);

		final boolean[] ctrlButton = {true, true};
		final Map<String, String> infoTeamMap = new LinkedHashMap<>();


		Controller.getInstance().setTeamInfoMap(teamID, infoTeamMap);

		final String prevLongName = infoTeamMap.get(GuiConfiguration.getMessage("team").toUpperCase());
		final String prevShortName = infoTeamMap.get(GuiConfiguration.getMessage("code"));

		MigLayout migLayout;
		AdminTopViewTeam adminTopViewTeam;
		TitleLabel titleLabel;
		LabelTextPanel longNamePanel;
		LabelTextPanel shortNamePanel;
		JButton confirmButton;


		migLayout = new MigLayout(
						GuiConfiguration.CENTER_VLAYOUT_CONSTRAINT,
						GuiConfiguration.ONE_CELL_FILL_SIZE_70P_LAYOUT_CONSTRAINT,
						GuiConfiguration.FIVE_CELL_EXT_GAP_10_0_INT_GAP_10_0_0_10_LAYOUT_CONSTRAINT
		);

		this.setLayout(migLayout);


		adminTopViewTeam = new AdminTopViewTeam(teamID, teamType);

		this.add(adminTopViewTeam);
		adminTopViewTeam.setGeneralInfoPanel(infoTeamMap);
		/*------------------------------------------------------------------------------------------------------*/

		titleLabel = new TitleLabel(GuiConfiguration.getMessage("editGeneralInfo"));
		this.add(titleLabel);
		/*------------------------------------------------------------------------------------------------------*/

		longNamePanel = new LabelTextPanel(GuiConfiguration.getMessage("longName"), ctrlLongName, Regex.patternAlnum);
		longNamePanel.getTextField().setText(prevLongName);
		this.add(longNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		shortNamePanel = new LabelTextPanel(GuiConfiguration.getMessage("shortName"), ctrlShortName, Regex.patternCode);
		shortNamePanel.getTextField().setText(prevShortName);
		this.add(shortNamePanel);
		/*------------------------------------------------------------------------------------------------------*/

		confirmButton = new JButton(GuiConfiguration.getMessage("confirm"));
		confirmButton.setEnabled(false);

		confirmButton.setOpaque(true);

		this.add(confirmButton);

		confirmButton.addPropertyChangeListener("enable", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				/*
				 if ((boolean) evt.getNewValue()) {
					 confirmButton.setBackground(UIManager.getColor("Button.background"));
				 }
				 else {
					 confirmButton.setForeground(Color.gray);
					 confirmButton.setBackground(Color.gray);
					 confirmButton.setOpaque(true);
				 }

				 */
			}
		});
		confirmButton.addActionListener(new ActionListener() {
			@Override
			public void actionPerformed(ActionEvent e)
			{
				String message = Controller.getInstance().updateTeam(
								teamID,
								teamType,
								ctrlLongName.getText(),
								ctrlShortName.getText()
				);
				System.out.println(message);

				try {
					JPanel panel = new AdminViewDelParticipation(teamID, teamType);

					AdminViewTeamGeneralInfo.this.setVisible(false);
					MainFrame.getMainFrameInstance().getContentPane().remove(AdminViewTeamGeneralInfo.this);

					MainFrame.getMainFrameInstance().getContentPane().add(panel, GuiConfiguration.HGROUP_FRAME_VGROW_ADD_CONSTRAINT);
					panel.setVisible(true);
				} catch (Exception ex) {
					System.out.println("ERRORE: " + ex.getMessage());
				}
			}
		});


		ctrlLongName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[0] = (null != ctrlLongName.getText());
				confirmButton.setEnabled(ctrlButton[0] && ctrlButton[1] && ((0 != StringUtils.compareIgnoreCase(ctrlLongName.getText(), prevLongName)) || (0 != StringUtils.compareIgnoreCase(ctrlShortName.getText(), prevShortName))));
			}
		});

		ctrlShortName.addPropertyChangeListener("text", new PropertyChangeListener() {
			@Override
			public void propertyChange(PropertyChangeEvent evt)
			{
				ctrlButton[1] = (null != ctrlShortName.getText());
				confirmButton.setEnabled(ctrlButton[0] && ctrlButton[1] && ((0 != StringUtils.compareIgnoreCase(ctrlLongName.getText(), prevLongName)) || (0 != StringUtils.compareIgnoreCase(ctrlShortName.getText(), prevShortName))));
			}
		});
	}
}
