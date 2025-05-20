function [Velmag,Velmapgmap] = V2_Get_velocity_sections(Im_bound)

[Sections21,~] = onlysectionsfrombound(Im_bound);

Headmap = Sections21.Head;
Tailmap = Sections21.Tail;
Midupmap = Sections21.Midup;
Middownmap = Sections21.Middown;
Velmapgmap{1,1} = Headmap;
Velmapgmap{2,1} = Midupmap;
Velmapgmap{3,1} = Middownmap;
Velmapgmap{4,1} = Tailmap;

Head = Headmap(Headmap~=0);
Tail = Tailmap(Tailmap~=0);
Midup = Midupmap(Midupmap~=0);
Middown = Middownmap(Middownmap~=0);

Velmag= groupunevenmatrix(Head,Midup,Middown,Tail);
end