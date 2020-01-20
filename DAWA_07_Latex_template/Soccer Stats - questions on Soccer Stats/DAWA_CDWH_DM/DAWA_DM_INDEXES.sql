-- Indexes for DM tables

--
-- Indexes for table `Location_DataMart`
--
ALTER TABLE `Location_DataMart`
  ADD PRIMARY KEY (`idPlace`);

--
-- Indexes for table `Match_results_DataMart`
--
ALTER TABLE `Match_results_DataMart`
  ADD PRIMARY KEY (`idMatch_results`),
  ADD KEY `idPlace` (`idPlace`),
  ADD KEY `idTeam` (`idTeam`),
  ADD KEY `idTime` (`idTime`);
  
--
-- Indexes for table `Team_DataMart`
--
ALTER TABLE `Team_DataMart`
  ADD PRIMARY KEY (`idTeam`);

--
-- Indexes for table `Time_DataMart`
--
ALTER TABLE `Time_DataMart`
  ADD PRIMARY KEY (`idTime`);

--
-- AUTO_INCREMENT for table `Location_DataMart`
--
ALTER TABLE `Location_DataMart`
  MODIFY `idPlace` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Match_results_DataMart`
--
ALTER TABLE `Match_results_DataMart`
  MODIFY `idMatch_results` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Team_DataMart`
--
ALTER TABLE `Team_DataMart`
  MODIFY `idTeam` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `Time_DataMart`
--
ALTER TABLE `Time_DataMart`
  MODIFY `idTime` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--
  
--
-- Constraints for table `Match_results_DataMart`
--
ALTER TABLE `Match_results_DataMart`
  ADD CONSTRAINT `Match_results_DataMart_ibfk_1` FOREIGN KEY (`idPlace`) REFERENCES `Location_DataMart` (`idplace`),
  ADD CONSTRAINT `Match_results_DataMart_ibfk_2` FOREIGN KEY (`idTeam`) REFERENCES `Team_DataMart` (`idteam`),
  ADD CONSTRAINT `Match_results_DataMart_ibfk_3` FOREIGN KEY (`idTime`) REFERENCES `Time_DataMart` (`idtime`) ON DELETE RESTRICT ON UPDATE RESTRICT;

