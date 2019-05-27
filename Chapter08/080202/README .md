### UICollectionView 

```swift
import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    // 9张图片的名称
    var images = ["Pic1", "Pic2", "Pic3", "Pic8", "Pic5", "Pic6", "Pic7", "Pic4", "Pic9",
        "Pic1", "Pic2", "Pic3", "Pic8", "Pic5", "Pic6", "Pic7", "Pic4", "Pic9",
        "Pic1", "Pic2", "Pic3", "Pic8", "Pic5", "Pic6", "Pic7", "Pic4", "Pic9"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let screenRect = UIScreen.main.bounds
        let rect = CGRect(x: 0, y: 20, width: screenRect.size.width, height: screenRect.size.height - 20)
        // 设置布局模式，该布局对象以网格的方式对 item 进行排列，并可以为每个章节设置头部和尾部内容。
        // 网格中的 item 按行和列进行紧密排列，并根据 cell 的尺寸信息，在一行中尽可能多的放 cell。
        // 另外，cell 的尺寸可以相同，也可以不同。
        let flowLayout = UICollectionViewFlowLayout()
        // 设置布局对象的 itemSize 属性，默认的 cell 大小为（50.0, 50.0）
        flowLayout.itemSize = CGSize(width: screenRect.width / 2 - 10, height: (screenRect.width / 2 - 10) * 335 / 500)//CGSize(width: 155, height: 135)
        // 设置滑动方向，只能水平或垂直二选一
        flowLayout.scrollDirection = UICollectionView.ScrollDirection.vertical
        // 创建一个 UICollectionView 对象，并设置大小和布局
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: flowLayout)
        // 设置数据源
        collectionView.dataSource = self
        // 设置代理对象
        collectionView.delegate = self
        // 由于集合对象是通过代码生成的，而不是通过storyboard 或 nib 文件生成，所以需要注册一个 UICollectionViewCell 类
        // 同时，forCellWithReuseIdentifier 的值应该与创建 UICollectionViewCell 对象时的重用标志字符串相同
        collectionView.register(UICollectionViewCell.classForCoder(), forCellWithReuseIdentifier: "reusedCell")
        self.view.addSubview(collectionView)
    }
    
    /// 设置指定章节中 item 的数目
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    /// 初始化并复用 UICollectionViewCell 对象
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let identifier = "reusedCell"
        // 新建 UICollectionViewCell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        // 获得屏幕的大小
        let screenRect = UIScreen.main.bounds
        // 获取 cell 中 tag 值为 1 的 UIImageView 对象
        let imageView: UIImageView? = cell.viewWithTag(1) as? UIImageView
        if imageView == nil {
            // 创建 UIImage 对象
            let image = UIImage(named: images[(indexPath as NSIndexPath).row])
            // 以 UIImage 为参数，创建 UIImageView 对象
            let imageView = UIImageView(image: image)
            // 设置 视图大小
            imageView.frame = CGRect(x: 5, y: 0, width: screenRect.width / 2 - 10, height: (screenRect.width / 2 - 10) * 335 / 500)
            // 设置透明度
            imageView.layer.opacity = 0.5
            // 设置 tag
            imageView.tag = 1
            // 将 UIImageView 对象加入 cell 中
            cell.addSubview(imageView)
        }
        else {
            // 图片视图不为空，则设置该视图的图片
            print("imageView != nil")
            imageView?.image = UIImage(named: images[(indexPath as NSIndexPath).row])
        }
        // 返回 UICollectionViewCell 对象
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // 根据 indexPath 获取 UICollectionView 对象
        let cell = collectionView.cellForItem(at: indexPath)
        // 获取 tag 为 1 的 UIView 对象
        let imageView = cell?.viewWithTag(1)
        // 获取亮度信息
        let opacity = imageView?.layer.opacity
        if opacity == 0.5 {
            // 设置亮度为 1（高亮）
            imageView?.layer.opacity = 1.0
        } else {
            // 设置亮度为 0.5（半透明）
            imageView?.layer.opacity = 0.5
        }
    }
}
```