-- Indexes for CDWH tables

--
-- Indexes for table `Country`
--
ALTER TABLE `Country`
  ADD PRIMARY KEY (`countryName`);

--
-- Indexes for table `Decades`
--
ALTER TABLE `Decades`
  ADD PRIMARY KEY (`idDecade`);

--
-- Indexes for table `Division`
--
ALTER TABLE `Division`
  ADD PRIMARY KEY (`idDivision`);

--
-- Indexes for table `Match_results`
--
ALTER TABLE `Match_results`
  ADD PRIMARY KEY (idMatch_results),
  ADD KEY `Team_idx` (`idTeam`),
  ADD KEY `Week_idx` (`idWeek`),
  ADD KEY `Stadium_idx` (`idStadium`);

--
-- Indexes for table `Season`
--
ALTER TABLE `Season`
  ADD PRIMARY KEY (`idSeason`),
  ADD KEY `Decade_idx` (`idDecade`);
  
--
-- Indexes for table `Stadium`
--
ALTER TABLE `Stadium`
  ADD PRIMARY KEY (`idStadium`),
  ADD KEY `State_idx` (`stateName`);

--
-- Indexes for table `State`
--
ALTER TABLE `State`
  ADD PRIMARY KEY (`stateName`),
  ADD KEY `Country_idx` (`countryName`);

--
-- Indexes for table `Team`
--
ALTER TABLE `Team`
  ADD PRIMARY KEY (`idTeam`),
  ADD KEY `idDivision` (`idDivision`);
  
--
-- Indexes for table `Week`
--
ALTER TABLE `Week`
  ADD PRIMARY KEY (`idWeek`),
  ADD KEY `Season_idx` (`idSeason`);
  
--
-- AUTO_INCREMENT for table `Match_results`
--
ALTER TABLE `Match_results`
  MODIFY `idMatch_results` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT for table `Team`
--
ALTER TABLE `Team`
  MODIFY `idTeam` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT for table `Stadium`
--
ALTER TABLE `Stadium`
  MODIFY `idStadium` int(11) NOT NULL AUTO_INCREMENT;
 
--
-- AUTO_INCREMENT for table `Decades`
--
ALTER TABLE `Decades`
  MODIFY `idDecade` int(11) NOT NULL AUTO_INCREMENT;
  
--
-- AUTO_INCREMENT for table `Division`
--
ALTER TABLE `Division`
  MODIFY `idDivision` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Season`
--
ALTER TABLE `Season`
  MODIFY `idSeason` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Match_results`
--
ALTER TABLE `Match_results`
  ADD CONSTRAINT `Stadium` FOREIGN KEY (`idStadium`) REFERENCES `Stadium` (`idstadium`),
  ADD CONSTRAINT `Team` FOREIGN KEY (`idTeam`) REFERENCES `Team` (`idteam`),
  ADD CONSTRAINT `Week` FOREIGN KEY (`idWeek`) REFERENCES `Week` (`idWeek`) ON DELETE CASCADE ON UPDATE CASCADE;
  
--
-- Constraints for table `Season`
--
ALTER TABLE `Season`
  ADD CONSTRAINT `Decade` FOREIGN KEY (`idDecade`) REFERENCES `Decades` (`iddecade`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Stadium`
--
ALTER TABLE `Stadium`
  ADD CONSTRAINT `State` FOREIGN KEY (`stateName`) REFERENCES `State` (`statename`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `State`
--
ALTER TABLE `State`
  ADD CONSTRAINT `Country` FOREIGN KEY (`countryName`) REFERENCES `Country` (`countryname`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `Team`
--
ALTER TABLE `Team`
  ADD CONSTRAINT `Team_ibfk_1` FOREIGN KEY (`idDivision`) REFERENCES `Division` (`iddivision`);

--
-- Constraints for table `Week`
--
ALTER TABLE `Week`
  ADD CONSTRAINT `Season` FOREIGN KEY (`idSeason`) REFERENCES `Season` (`idseason`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;