Declare @SchoolId int
Select @SchoolId=SchoolId from SchoolSettings 

DECLARE @ObservationSkills XML = '
<Skills>
  <Skill>
    <Id>88</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>11</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>11</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>89</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>12</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>12</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>90</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>13</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>13</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>91</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>14</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>14</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>92</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>15</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>15</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>93</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>6</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>6</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>94</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>7</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>7</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>95</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>8</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>8</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>96</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>9</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>9</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>97</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>10</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>10</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Marathi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>98</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>6</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>6</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>99</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>7</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>7</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>100</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>8</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>8</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>101</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>9</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>9</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>102</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>10</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>10</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>103</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>6</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>6</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>104</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>10</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>10</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>105</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>9</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>9</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>106</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>10</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>10</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>107</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>6</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>6</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>108</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>7</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>7</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>109</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>8</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>8</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>110</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>9</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>9</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>111</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>8</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>8</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>112</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>9</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>9</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>113</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>10</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>10</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>114</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>6</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>6</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>115</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>7</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>7</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>116</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>8</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>8</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>117</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>7</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>7</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>118</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>8</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>8</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>119</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>9</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>9</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>120</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>10</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>10</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>121</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>6</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>6</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>122</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>7</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>7</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Hindi</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>123</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>1</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>1</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>124</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>2</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>2</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>125</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>3</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>3</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>126</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>4</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>4</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>127</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>5</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>5</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>128</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>1</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>1</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>129</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>5</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>5</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>130</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>4</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>4</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>131</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>5</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>5</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>132</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>1</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>1</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>133</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>2</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>2</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>134</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>3</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>3</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>135</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>4</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>4</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>136</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>3</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>3</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>137</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>4</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>4</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>138</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>5</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>5</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>139</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>1</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>1</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>140</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>2</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>2</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>141</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>3</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>3</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>142</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>2</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>2</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>143</Id>
    <Name>SPEAKING SKILLS</Name>
    <OriginalSkillId>3</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>3</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>144</Id>
    <Name>LISTENING SKILLS</Name>
    <OriginalSkillId>4</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>4</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>145</Id>
    <Name>REGULARITY IN ASSIGNMENTS</Name>
    <OriginalSkillId>5</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>5</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>146</Id>
    <Name>READING SKILLS</Name>
    <OriginalSkillId>1</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>1</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>147</Id>
    <Name>WRITING SKILLS</Name>
    <OriginalSkillId>2</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>2</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>English</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>148</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>16</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>16</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>149</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>16</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>16</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>150</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>16</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>16</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>151</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>16</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>16</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>152</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>11</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>11</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Mathematics</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>153</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>17</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>17</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>154</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>17</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>17</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>155</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>17</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>17</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>156</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>17</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>17</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>157</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>12</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>12</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>EVS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>158</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>18</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>18</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>159</Id>
    <Name>ASPECTS </Name>
    <OriginalSkillId>13</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>13</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Computers</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>160</Id>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <OriginalSkillId>19</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>19</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>161</Id>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <OriginalSkillId>19</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>19</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>162</Id>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <OriginalSkillId>19</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>19</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>163</Id>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <OriginalSkillId>19</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>19</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>164</Id>
    <Name>CO-CURRICULAR ACTIVITIES</Name>
    <OriginalSkillId>14</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>14</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>CO-CURRICULAR ACTIVITIES</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>165</Id>
    <Name>SPORTS</Name>
    <OriginalSkillId>21</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>21</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>166</Id>
    <Name>SPORTS</Name>
    <OriginalSkillId>16</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>16</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>167</Id>
    <Name>SPORTS</Name>
    <OriginalSkillId>0</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>30</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>168</Id>
    <Name>SPORTS</Name>
    <OriginalSkillId>0</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>35</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>169</Id>
    <Name>SPORTS</Name>
    <OriginalSkillId>0</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>40</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>SPORTS</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>170</Id>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <OriginalSkillId>20</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>20</SortOrder>
    <Standard_Name>1</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>171</Id>
    <Name>PERSONAL &amp; SOCIAL TRAITS </Name>
    <OriginalSkillId>15</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>15</SortOrder>
    <Standard_Name>2</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>172</Id>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <OriginalSkillId>0</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>25</SortOrder>
    <Standard_Name>Nursery</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>173</Id>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <OriginalSkillId>0</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>25</SortOrder>
    <Standard_Name>Junior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
  <Skill>
    <Id>174</Id>
    <Name>PERSONAL &amp; SOCIAL TRAITS</Name>
    <OriginalSkillId>0</OriginalSkillId>
    <DisplayOnReport>1</DisplayOnReport>
    <SortOrder>25</SortOrder>
    <Standard_Name>Senior KG</Standard_Name>
    <Subject_Name>Personal &amp; Social Traits</Subject_Name>
    <IsDeleted>0</IsDeleted>
  </Skill>
</Skills>';

DECLARE @tempObservationSkills AS Table
(
    Name                NVARCHAR(200),
    OriginalSkillId     INT,
    DisplayOnReport     BIT,
    SortOrder           INT,
    StandardName        NVARCHAR(100),
    SubjectName         NVARCHAR(200),
    IsDeleted            BIT
);

INSERT INTO @tempObservationSkills 
(
    Name,
    OriginalSkillId,
    DisplayOnReport,
    SortOrder,
    StandardName,
    SubjectName,
    IsDeleted
)
SELECT
    T.c.value('(Name)[1]', 'NVARCHAR(200)'),
    T.c.value('(OriginalSkillId)[1]', 'INT'),
    T.c.value('(DisplayOnReport)[1]', 'BIT'),
    T.c.value('(SortOrder)[1]', 'INT'),
    T.c.value('(Standard_Name)[1]', 'NVARCHAR(100)'),
    T.c.value('(Subject_Name)[1]', 'NVARCHAR(200)'),
    T.c.value('(IsDeleted)[1]', 'BIT')
FROM @ObservationSkills.nodes('/Skills/Skill') T(c);


INSERT INTO ObservationSkills
(
    Name, OriginalSkillId,   DisplayOnReport, SortOrder,StandardId, SubjectId, SchoolId, AcademicYearId, IsDeleted,
    InsertedById, InsertDate, UpdatedById, UpdateDate)
SELECT
    T.Name, 0,T.DisplayOnReport, T.SortOrder,SM.Standard_Id, SubM.Subject_Id, @SchoolId,1,
    T.IsDeleted, 1,  dbo.GetLocalDate(DEFAULT), 1, dbo.GetLocalDate(DEFAULT)
FROM @tempObservationSkills T
INNER JOIN Standard_Master SM
    ON SM.Standard_Name = T.StandardName
	AND SM.academic_Year_Id=1
	AND SM.School_Id=@SchoolId
INNER JOIN Subject_Master SubM
    ON SubM.Subject_Name = T.SubjectName
	AND SM.academic_Year_Id=SubM.academic_Year_Id
	AND SM.School_Id=SubM.School_Id
	Where SM.Is_Deleted='N'
	AND SubM.Is_Deleted='N'
	AND SM.academic_Year_Id=1
	AND SM.School_Id=@SchoolId;

UPDATE ObservationSkills
SET OriginalSkillId = Id
WHERE 
 SchoolId = @SchoolId
AND AcademicYearId = 1;



