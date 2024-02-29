//package gui;
//
//import net.miginfocom.swing.MigLayout;
//
//import javax.swing.*;
//import java.awt.event.InputMethodEvent;
//import java.awt.event.InputMethodListener;
//import java.beans.PropertyChangeEvent;
//import java.beans.PropertyChangeListener;
//import java.util.ArrayList;
//import java.util.List;
//
//public class TestPanel
//				extends JPanel
//{
//	private final JLabel controlLabel;
//	public TestPanel()
//	{
//		this.controlLabel = new JLabel();
//
//		MigLayout migLayout;
//
//		migLayout = new MigLayout(
//						"debug, flowy, fill",
//						"0[fill]0",
//						"10[]10[]0[]10"
//		);
//
//		this.setLayout(migLayout);
//
//
//		JPanel centralPanel = new JPanel();
//		migLayout = new MigLayout(
//						"debug, wrap 2",
//						"10[60%, fill]50[35%, fill]10",
//						"0[]0[fill]10[]0[fill]20[]0"
//		);
//		centralPanel.setLayout(migLayout);
//
//		this.add(new TopSearchPanel("Bottone1", this, centralPanel), "sgx e");
//
//		ArrayList<String> rrr = new ArrayList<>();
//		rrr.add("radio1");
//		rrr.add("radio2");
//		rrr.add("radio3");
//
//		centralPanel.add(new CountryTypeRadioPanel("SCEGLI TIPO PAESE"));
//		centralPanel.add(new InfoPanel("INFO"));
//		centralPanel.add(new TeamTypeRadioPanel("SCEGLI TIPO SQUADRA"));
//		centralPanel.add(new InfoPanel("INFO"));
//		centralPanel.add(new CompetitionTypeRadioPanel("SCEGLI TIPO COMPETIZIONE"));
//		centralPanel.add(new InfoPanel("INFO"));
//		centralPanel.add(new PlayerRoleCheckPanel("SCEGLI RUOLO"));
//		centralPanel.add(new InfoPanel("INFO"));
//		centralPanel.add(new PlayerFootRadioPanel("SCEGLI RUOLO"));
//		centralPanel.add(new InfoPanel("INFO"));
//
//		this.add(centralPanel, "sgx e");
//
//		controlLabel.addPropertyChangeListener(new PropertyChangeListener() {
//			@Override
//			public void propertyChange(PropertyChangeEvent evt) {
//				getValueControl();
//			}
//		});
//
//
//
//	}
//
//	public void getValueControl()
//	{
//		System.out.println(controlLabel.getText());
//	}
//}
