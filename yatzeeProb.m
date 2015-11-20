function yatzeeProb

end

function out = yatzeePlayer(diceIn,rollsLeft,points)
	%{
	This is just a for fun part ot the project. I'm sure I can do a Monte
	Carlo simulation with this guy and get the average score, which would
	look good on the project, but I really want to do this for 
	%}
	
	
end

function out = fullHouseState(roll)
	% roll is a row vector consisting of the dice to keep
	% out is the statespace that would happen if roll is kept ROW
	repeats = zeros(6,1);
	for i=1:6
		repeats(i) = sum(roll==i);
	end
	[val1,ind1] = max(repeats);
	repeats(ind1) = 0;
	[val2,ind2] = max(repeats);
	repeats(ind2)=0;
	out = -1;
	if sum(repeats)==0
		if val1==0 && val2==0
			out = [1,0,0,0,0,0];
		elseif val1==2 && val2==1
			out = [0,1,0,0,0,0];
		elseif val1==3 && val2==0
			out = [0,0,1,0,0,0];
		elseif val1==3 && val2==1
			out = [0,0,0,1,0,0];
		elseif val1==2 && val2==2
			out = [0,0,0,0,1,0];
		elseif val1==3 && val2==2
			out = [0,0,0,0,0,1];
		end
	end
end
	
function [out,dice] = yatzeeState(roll)
	% roll is a row vector consisting of the dice to keep
	% out is the statespace that would happen if roll is kept ROW
	repeats = zeros(6,1);
	for i=1:6
		repeats(i) = sum(roll==i);
	end
	[val,ind] = max(repeats);
	out = -1;
	if sum(repeats)==0 
		if val==0
			val=1;
		end
		out = [0,0,0,0,0];
		out(val)=1;
	end
	if val ~= 1
		dice = (roll==ind);
	else
		dice = (roll==-1);
end

function num = expectedVal(in,vals,Mat,times)
	%{
	Params:
	in: row vector of the odds going in
	vals: value in terms of points for the vector coming out column
	Mat: Probability distribution matrix
	times: number of rolls left
	%}
	Mat = Mat ^ times;
	num = in*Mat*vals;
end

function out = YatzeeM
	D=diag([6^5,6^4,6^3,6^2,6^1]);
	P=[
		720,5400,1500,150,6;
		0,720,480,90,6;
		0,0,150,60,6;
		0,0,0,30,6;
		0,0,0,0,6
	];
	out = D^-1*P;
end

function out = NumberM
	D=diag([6^5,6^4,6^3,6^2,6^1,6^0]);
	P=[
		3125,3125,1250,250,25,1;
		0,625,500,150,20,1;
		0,0,125,75,15,1;
		0,0,0,25,10,1;
		0,0,0,0,5,1;
		0,0,0,0,0,1
	];
	out = D^-1*P;
end

function out = FullHouseM
	D=diag([6^5,6^2,6^2,6^1,6^1,6^0]);
	P=[
		720,3600,6,1350,1800,300;
		0,25,0,2,2,2;
		0,0,1,30,0,5;
		0,0,0,5,0,1;
		0,0,0,0,4,2;
		0,0,0,0,0,1;
	];
	out = D^-1*P;
end