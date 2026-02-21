-- Normalize state abbreviations to full names
-- Some states already have full names (Georgia, Arizona, Indiana, etc.)
-- This converts remaining abbreviations to match

UPDATE bars SET state = 'California' WHERE state = 'CA';
UPDATE bars SET state = 'Colorado' WHERE state = 'CO';
UPDATE bars SET state = 'Washington DC' WHERE state = 'DC';
UPDATE bars SET state = 'Florida' WHERE state = 'FL';
UPDATE bars SET state = 'Illinois' WHERE state = 'IL';
UPDATE bars SET state = 'Kentucky' WHERE state = 'KY';
UPDATE bars SET state = 'Massachusetts' WHERE state = 'MA';
UPDATE bars SET state = 'Minnesota' WHERE state = 'MN';
UPDATE bars SET state = 'Missouri' WHERE state = 'MO';
UPDATE bars SET state = 'North Carolina' WHERE state = 'NC';
UPDATE bars SET state = 'Nevada' WHERE state = 'NV';
UPDATE bars SET state = 'New York' WHERE state = 'NY';
UPDATE bars SET state = 'Ohio' WHERE state = 'OH';
UPDATE bars SET state = 'Oregon' WHERE state = 'OR';
UPDATE bars SET state = 'Pennsylvania' WHERE state = 'PA';
UPDATE bars SET state = 'Tennessee' WHERE state = 'TN';
UPDATE bars SET state = 'Texas' WHERE state = 'TX';
UPDATE bars SET state = 'Virginia' WHERE state = 'VA';
UPDATE bars SET state = 'Washington' WHERE state = 'WA';
