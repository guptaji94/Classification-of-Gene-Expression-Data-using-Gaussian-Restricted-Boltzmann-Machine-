# -*- coding: utf-8 -*-
"""
Created on Mon May 15 17:47:13 2017

@author: Jit
"""

from __future__ import print_function
import os.path
import sys
import xlrd
import numpy as np

from sklearn.neighbors import NearestNeighbors
from sklearn.svm import SVC

from imblearn.over_sampling import SMOTE

# Generate a global dataset to use
RND_SEED = 0
book = xlrd.open_workbook("F:/Dot/Downloads/truncated.xls") 
sheet = book.sheet_by_index(0)

X=[]
for row in range (sheet.nrows):
    _row = []
    for col in range (sheet.ncols):
        _row.append(sheet.cell_value(row,col))
    X.append(_row)
X=np.asmatrix(X)
Y = []
X=X.transpose()
for i in range(96):
    if i<87:
        Y.append(2)
    else:
        Y.append(1)
R_TOL = 1e-4


kind = 'regular'
smote = SMOTE(random_state=RND_SEED, kind=kind)
# Fit the data
smote.fit(X, Y)

X_resampled, y_resampled = smote.fit_sample(X, Y)
print (X_resampled)   

    
