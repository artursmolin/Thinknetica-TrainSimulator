months = { 
  January: 31, 
  February: 28, 
  March: 31, 
  April: 30, 
  May: 31, 
  June: 30, 
  July: 31, 
  August: 31, 
  Semptember: 30, 
  October: 31, 
  November: 30, 
  December: 31 }

month_with_30days = months.select { |k,v| v==30 }
print month_with_30days