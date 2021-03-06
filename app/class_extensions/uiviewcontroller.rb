class UIViewController

  def setTitle(title, subtitle:subtitle)
    if subtitle.nil?
      self.title = title
      return
    end

    self.navigationItem.titleView = nil

    created = false
    titleView = self.navigationItem.titleView
    labelTitle = nil
    labelSubtitle = nil

    if titleView.nil?
        created = true

        titleView = UIView.alloc.initWithFrame CGRectZero
        labelTitle = UILabel.alloc.initWithFrame CGRectZero
        labelSubtitle = UILabel.alloc.initWithFrame CGRectZero

        if Device.ios_version.to_i < 7
          labelTitle.shadowColor = UIColor.darkGrayColor
          labelTitle.textColor = UIColor.whiteColor
          labelSubtitle.textColor = UIColor.whiteColor
          labelSubtitle.shadowColor = UIColor.darkGrayColor
        else
          labelTitle.shadowColor = UIColor.lightGrayColor
          labelTitle.textColor = UIColor.blackColor
          labelSubtitle.textColor = UIColor.blackColor
          labelSubtitle.shadowColor = UIColor.lightGrayColor
        end
        labelTitle.backgroundColor = UIColor.clearColor
        labelSubtitle.backgroundColor = UIColor.clearColor
        labelTitle.lineBreakMode = UILineBreakModeTailTruncation
        labelTitle.textAlignment = UITextAlignmentCenter
        labelSubtitle.textAlignment = UITextAlignmentCenter
        labelSubtitle.lineBreakMode = UILineBreakModeTailTruncation
        labelTitle.font = UIFont.boldSystemFontOfSize 18
        labelSubtitle.font = UIFont.systemFontOfSize 14

        titleView.addSubview labelTitle
        titleView.addSubview labelSubtitle

    end

    labelTitle.text = title
    labelSubtitle.text = subtitle
    labelTitle.sizeToFit
    labelSubtitle.sizeToFit

    titleView.frame = CGRectMake(
      0,
      0,
      [labelTitle.bounds.size.width, labelSubtitle.bounds.size.width].max,
      self.navigationController.navigationBar.bounds.size.height
    )

    labelTitle.center = CGPointMake(titleView.bounds.size.width / 2, 15)
    labelSubtitle.center = CGPointMake(titleView.bounds.size.width / 2, 31)
    labelTitle.frame = CGRectIntegral(labelTitle.frame)
    labelSubtitle.frame = CGRectIntegral(labelSubtitle.frame)

    titleView.autoresizesSubviews = true
    titleView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                                 UIViewAutoresizingFlexibleLeftMargin |
                                 UIViewAutoresizingFlexibleRightMargin
    labelTitle.autoresizingMask = titleView.autoresizingMask
    labelSubtitle.autoresizingMask = titleView.autoresizingMask

    if created
      self.navigationItem.titleView = titleView;
    end

  end

end
