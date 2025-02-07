from openpyxl import load_workbook
from openpyxl.utils import get_column_letter


workbook = load_workbook(filename='/Users/chabgood/projects/calimove_tracker/spec/fixtures/files/test_upload.xlsx')
sheet = workbook.active

for row in sheet.iter_rows(values_only=True):
  # if all(x is not None for x in row):
  if 'Level' not in row and 'Set 1' in row:
    print(row)

    #for column in row:
      #fill = column.fill
      #if fill.patternType is not None:
        # print(row)
        # print(column.fill)
    #breakpoint()

  # if fill.patternType is not None: # Check if the cell is filled
  #     if fill.fgColor.type == 'rgb':
  #         hex_color = fill.fgColor.rgb
  #         print(f"The color of cell {cell.coordinate} is: #{hex_color.hex}") # Print the hex code
  #     else:
  #         print(f"The color of cell {cell.coordinate} is indexed or themed.")
  # else:
  #      print(f"Cell {cell.coordinate} has no fill color.")

