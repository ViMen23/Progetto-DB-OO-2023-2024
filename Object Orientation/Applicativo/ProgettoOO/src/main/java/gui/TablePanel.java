package gui;

import net.miginfocom.swing.MigLayout;

import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.*;
import java.util.Vector;

public class TablePanel
				extends JPanel
{
	private final TitleLabel titleLabel;
	private final JTextArea textArea;
	private final MyScrollPane myScrollPane;

	public TablePanel(Boolean sort,
										String description,
										JLabel controlColumnLabel,
										JLabel controlRowLabel,
										JLabel controlMouseLabel)
	{
		MigLayout migLayout;

		migLayout = new MigLayout(
						GuiConfiguration.tablePanelLayoutConstraint,
						GuiConfiguration.tablePanelColumnConstraint,
						GuiConfiguration.tablePanelRowConstraint + "[]10"
		);

		this.setLayout(migLayout);
		this.setBackground(Color.white);


		this.titleLabel = new TitleLabel(GuiConfiguration.getMessage("msgNoSearch"));
		this.add(titleLabel);

		this.textArea = new JTextArea(description);
		textArea.setEditable(false);
		textArea.setBorder(null);

		this.add(textArea);

		this.myScrollPane = new MyScrollPane(sort, controlColumnLabel, controlRowLabel, controlMouseLabel);
		this.add(myScrollPane);
	}

	public void fillTable(Vector<Vector<String>> tableData, Vector<String> tableColumnName)
	{

		MyTable myTable = this.myScrollPane.getMyTable();
		myTable.setModel(new TableModel(tableData, tableColumnName));

		myTable.setPreferredScrollableViewportSize(myTable.getPreferredSize());
	}

	public void setTextTitleLabel(String title)
	{
		this.titleLabel.setText(title);
	}

	public void setDescriptionTextArea(String description)
	{
		this.textArea.setText(description);
	}
}
