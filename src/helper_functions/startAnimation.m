function startAnimation(ax, VanishingPoint3D, TwelfPoints3D)
    %% animation
    % In this function, basic movements of the camera are defined, which are zoom
    % in/zoom out/look up/look down/turn left/turn right. A tour animation
    % using these 6 types of camera movements is generated for demonstration.

    % the initial point of the camera should not coincide with the vanishing
    % point. It should be set to align with the center of the rear wall,
    % otherwise the whole picture is going to have some offset.
    center = [(TwelfPoints3D(1,1)+TwelfPoints3D(1,2))/2, (TwelfPoints3D(2,1)+TwelfPoints3D(2,7))/2];
    Xbound = abs((TwelfPoints3D(1,2)-TwelfPoints3D(1,1))/2)*0.75;
    Ybound = abs((TwelfPoints3D(2,7)-TwelfPoints3D(2,1))/2)*0.75;
    Zubound = max(TwelfPoints3D(3,3), TwelfPoints3D(3,5));
    Zlbound = (TwelfPoints3D(3,3) - VanishingPoint3D(3)) * 0.75;

    camproj(ax, 'perspective');
    camva(ax, 90);
    camup(ax, [0, 1, 0]);
    camtarget(ax, [center 0]);

    % Prepare GIF
    gifFilename = '../animation/animation.gif';
    delayTime = 0; % Delay time for each frame

    % zoom in
    for z = Zubound:-5:Zlbound
        campos(ax, [center(1), center(2), z]);
        drawnow;
        pause(0)
        frame = getframe(ax);
        im = frame2im(frame);
        [imind, cm] = rgb2ind(im, 256);
        if z == Zubound
            imwrite(imind, cm, gifFilename, 'gif', 'Loopcount', inf, 'DelayTime', delayTime);
        else
            imwrite(imind, cm, gifFilename, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
        end
    end

    % look up (camera moves down)
    for y = 0:-5:-Ybound
        campos(ax, [center(1), center(2)+y, Zlbound]);
        drawnow;
        pause(0)
        frame = getframe(ax);
        im = frame2im(frame);
        [imind, cm] = rgb2ind(im, 256);
        imwrite(imind, cm, gifFilename, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
    end

    % look down (camera moves up)
    for y = -Ybound:5:Ybound
        campos(ax, [center(1), center(2)+y, Zlbound]);
        drawnow;
        pause(0)
        frame = getframe(ax);
        im = frame2im(frame);
        [imind, cm] = rgb2ind(im, 256);
        imwrite(imind, cm, gifFilename, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
    end

    % look up again (camera moves down)
    for y = Ybound:-5:0
        campos(ax, [center(1), center(2)+y, Zlbound]);
        drawnow;
        pause(0)
        frame = getframe(ax);
        im = frame2im(frame);
        [imind, cm] = rgb2ind(im, 256);
        imwrite(imind, cm, gifFilename, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
    end

    % turn right
    for x = 0:5:Xbound
        campos(ax, [center(1)+x, center(2), Zlbound]);
        camtarget(ax, [center(1)+x, center(2), VanishingPoint3D(3)]);
        drawnow;
        pause(0)
        frame = getframe(ax);
        im = frame2im(frame);
        [imind, cm] = rgb2ind(im, 256);
        imwrite(imind, cm, gifFilename, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
    end

    % turn left
    for x = Xbound:-5:-Xbound
        campos(ax, [center(1)+x, center(2), Zlbound]);
        camtarget(ax, [center(1)+x, center(2), VanishingPoint3D(3)]);
        drawnow;
        pause(0)
        frame = getframe(ax);
        im = frame2im(frame);
        [imind, cm] = rgb2ind(im, 256);
        imwrite(imind, cm, gifFilename, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
    end

    % turn right to initial point
    for x = -Xbound:5:0
        campos(ax, [center(1)+x, center(2), Zlbound]);
        camtarget(ax, [center(1)+x, center(2), VanishingPoint3D(3)]);
        drawnow;
        pause(0)
        frame = getframe(ax);
        im = frame2im(frame);
        [imind, cm] = rgb2ind(im, 256);
        imwrite(imind, cm, gifFilename, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
    end

    % zoom out
    for z = Zlbound:-5:Zubound
        campos(ax, [center(1), center(2), z]);
        drawnow;
        pause(0)
        frame = getframe(ax);
        im = frame2im(frame);
        [imind, cm] = rgb2ind(im, 256);
        imwrite(imind, cm, gifFilename, 'gif', 'WriteMode', 'append', 'DelayTime', delayTime);
    end
end
