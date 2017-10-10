# -*- coding: utf-8 -*-
"""
Created on Thu May 18 20:01:22 2017

@author: Jit
"""


from sklearn.ensemble import RandomForestRegressor
import numpy as np
import xlrd
#Load boston housing dataset as an example
book = xlrd.open_workbook("F:/Dot/Downloads/truncated.xls") 
sheet = book.sheet_by_index(0)

X=[]
for row in range (sheet.nrows):
    _row = []
    for col in range (sheet.ncols):
        _row.append(sheet.cell_value(row,col))
    X.append(_row)
X=np.asmatrix(X)
X=X.transpose()
Y = []
for i in range(96):
    if i<87:
        Y.append([2])
    else:
        Y.append([1])
names=np.arange(1,4967)
rf = RandomForestRegressor()
rf.fit(X, Y)
print "Features sorted by their score:"
print sorted(zip(map(lambda x: round(x, 4), rf.feature_importances_),names ), 
             reverse=True)
