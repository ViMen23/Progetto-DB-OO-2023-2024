/******************************************************************************* 
 * PROJECT NAME : FOOTBALL PLAYER DATABASE                                    
 *                                                                            
 * UNIVERSITY   : FEDERICO II - NAPOLI - ITALY                                 
 * FIELD        : COMPUTER SCIENCE                                            
 * CLASS        : DATA BASES I                                                
 * TEACHER      : SILVIO BARRA                                                
 * YEAR         : 2023-2024                                                   
 ******************************************************************************/


/*******************************************************************************
 * INSERT attr
 ******************************************************************************/
INSERT INTO attr (type, name, descr)
VALUES
(
	'KEY ATTRIBUTE', 
	'Determination', 
	'It describes a players commitment and hunger'
	'to succeed both on and off the pitch'
),
(
	'KEY ATTRIBUTE', 
	'Anticipation', 
	'Anticipation refers to how well a player'
	'can predict and react to an event'
),
(
	'KEY ATTRIBUTE',
	'Decisions',
	'Decisions refers to a players ability'
	'to make the correct choice both with and'
	'without the ball a majority of times'
),
(
	'TEAM WORK',
	'Teamwork',
	'Teamwork reflects how well a player follows'
	'tactical instructions whilst working for and'
	'alongside his team mates'
),
(
	'TEAM WORK',
	'Work Rate',
	'Work Rate reflects the player’s mental drive'
	'to work to his full capacities'
),
(
	'TEAM WORK',
	'Bravery',
	'Bravery mainly reflects how committed'
	'the player is on the pitch'
),
(
	'TEAM WORK',
	'Leadership',
	'Leadership refers to a players ability'
	'to influence players around them on the pitch'
),
(
	'TECHNICAL - IN POSSESSION',
	'Technique',
	'Technique refers to how refined the player'
	'appear to be with the ball – their aesthetic quality'
	'with the ball, either it’s the competency to pass the ball,'
	'shoot, cross or dribble with the ball'
),
(
	'TECHNICAL - IN POSSESSION',
	'Passing',
	'Passing reflects a player’s ability to successfully find'
	'a teammate with the ball – how good the player is'
	'at passing the ball'
),
(
	'TECHNICAL - IN POSSESSION',
	'First Touch',
	'First Touch refers to how good a player is at receiving the ball'
	'and immediately get control of it when passed to his feet'
),
(
	'TECHNICAL - IN POSSESSION',
	'Dribbling',
	'Dribbling refers to a player’s ability to run with the ball'
	'and manipulate it under close control'
),
(
	'TECHNICAL - IN POSSESSION',
	'Heading',
	'Heading solely refers to the player’s competency at'
	'heading the ball and dealing with aerial situations'
),
(
	'TECHNICAL - OUT POSSESSION',
	'Tackling',
	'Tackling reflects how well the player will be at'
	'winning the ball cleanly without conceding fouls'
	'when tackling another player'
),
(
	'TECHNICAL - OUT POSSESSION',
	'Marking',
	'Marking reflects how well the player sticks close to'
	'his direct opposition in defensive situations'
),
(
	'TECHNICAL - ATTACKING',
	'Finishing',
	'Finishing reflects a player’s ability to put the ball'
	'in the back of the net when presented with a chance'
),
(
	'TECHNICAL - ATTACKING',
	'Crossing',
	'Crossing reflects a player’s competency to'
	'cross the ball predominantly but not exclusively'
	'from wide areas accurately'
),
(
	'TECHNICAL - ATTACKING',
	'Long Shots',
	'Long Shots reflects a player’s quality in shooting'
	'from distance or more accurately from outside the penalty area'
),
(
	'TACTICAL - DEFENDING',
	'Positioning',
	'Positioning reflects a player’s ability to'
	'read situations and position himself accordingly and'
	'in the best possible manner to deal with the unfolding events'
),
(
	'TACTICAL - DEFENDING',
	'Concentration',
	'Concentration reflects a player’s mental focus and attention to'
	'detail on an event-by-event basis, where players with'
	'high concentration will be able to concentrate better'
	'for a longer time and respond to incidents both'
	'early as well as late in the game'
),
(
	'TACTICAL - DEFENDING',
	'Aggression',
	'Aggression reflects a player’s attitude in terms of playing mentality'
	'but is not necessarily a dirtiness indicator'
),
(
	'TACTICAL - ATTACKING',
	'Off the Ball',
	'Off the ball reflects a player’s ability to move'
	'when not in possession of the ball, making them available to'
	'receive a pass in a more dangerous position'
),
(
	'TACTICAL - ATTACKING',
	'Vision',
	'Vision reflects a player’s ability to'
	'spot a potential opportunity'
),
(
	'TACTICAL - ATTACKING',
	'Flair',
	'Flair reflects the natural talent of the individual'
	'of being creative and occasionally unpredictable'
),
(
	'TACTICAL - ATTACKING',
	'Composure',
	'Composure reflects the player’s steadiness of mind and'
	'ability, particularly with the ball but also without it,'
	'to make more intelligent decisions'
),
(
	'SET PIECE',
	'Free Kick Taking',
	'Free Kick Taking reflects the competency of'
	'the player to strike a dead ball'
),
(
	'SET PIECE',
	'Corners',
	'Corners reflects how well the player takes'
	'a corner kick and how accurately the corner is taken'
),
(
	'SET PIECE',
	'Penalty Taking',
	'Penalty Taking reflects a player’s ability'
	'from the penalty spot, and determines the success and'
	'failure of the penalty kick'
),
(
	'SET PIECE',
	'Long Throws',
	'Long Throws reflects a player’s ability to'
	'perform a long throw, which can be beneficial'
	'in attacking situations or to get the ball out'
	'of defensive areas and into the final third quicker'
),
(
	'PHYSICAL',
	'Strength',
	'Strength reflects a player’s ability to'
	'exert his physical force on an opponent to his benefit'
),
(
	'PHYSICAL',
	'Stamina',
	'Stamina refers to how well a player can endure'
	'high-level physical activities for a long period of time'
),
(
	'PHYSICAL',
	'Natural Fitness',
	'Natural Fitness is not a typical attribute'
	'in regard to competency on the pitch,'
	'but describes more his genes and level of physic'
),
(
	'PHYSICAL',
	'Acceleration',
	'Acceleration refers to how quickly the player'
	'reaches top speed from a standing start'
),
(
	'PHYSICAL',
	'Pace',
	'Pace refers to a players top speed'
),
(
	'PHYSICAL',
	'Agility',
	'Agility reflects how well a player can start,'
	'stop, and move in different directions at varying levels of'
	'speed (pace), both with or without the ball'
),
(
	'PHYSICAL',
	'Balance',
	'Balance refers to how well the player is able to'
	'keep his balance and stay on his feet with and'
	'without the ball whilst being in control of their actions'
	'when moving, turning, or changing directions'
),
(
	'PHYSICAL',
	'Jumping Reach',
	'Jumping Reach reflects how good a player is at'
	'reaching the ball in the air'
),
(
	'GOALKEEPER',
	'Aerial Reach',
	'Aerial Reach reflects how well a player’s physical ability to'
	'challenge in aerial situations'
),
(
	'GOALKEEPER',
	'Command of Area',
	'Command of Area reflects the goalkeeper’s ability to'
	'instinctively take charge of his penalty area'
	'by coming for crosses and commanding his defensive line'
),
(
	'GOALKEEPER',
	'Communication',
	'Communication reflects the goalkeeper’s ability to'
	'communicate with his defensive line and organise'
	'the defensive side of the team'
),
(
	'GOALKEEPER',
	'Eccentricity',
	'Eccentricity reflects the goalkeeper’s tendency to'
	'do the unexpected with or without the ball'
),
(
	'GOALKEEPER',
	'Handling',
	'Handling reflects the goalkeeper’s ability to'
	'hold onto the ball when making a save'
),
(
	'GOALKEEPER',
	'Kicking',
	'Kicking reflects both the distance the goalkeeper'
	'can kick to and the accuracy he can find both'
	'from hand and from dead-ball restarts'
),
(
	'GOALKEEPER',
	'One On Ones',
	'One On Ones reflects the goalkeeper’s ability to'
	'do well when faced with an opponent in a one on one situation'
),
(
	'GOALKEEPER',
	'Punching Tendency',
	'Punching Tendency reflects the goalkeeper’s inclination to'
	'punch the ball clear in situations where'
	'he could perhaps attempt to catch the ball'
),
(
	'GOALKEEPER',
	'Reflexes',
	'Reflexes reflects the goalkeeper’s ability to react to'
	'unpredictable events with a high success rate'
),
(
	'GOALKEEPER',
	'Rushing Out Tendency',
	'Rushing Out Tendency reflects the goalkeeper’s tendency to'
	'come off his line to react to through balls and crosses'
),
(
	'GOALKEEPER',
	'Throwing',
	'Throwing reflects the goalkeeper’s ability to'
	'accurately distribute the ball from his hands'
);
--------------------------------------------------------------------------------

