package cn.edu.zjut.homework0509;

import android.content.Context;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Rect;
import android.os.Build;
import android.view.View;

import androidx.annotation.RequiresApi;

import java.util.ArrayList;
import java.util.List;
import java.util.Timer;
import java.util.TimerTask;

public class MyView extends View {
    private int height, width;
    private int pic_height, pic_width;
    private Bitmap pic;
    private int c_left,c_top,c_right,c_bottom;
    Rect need,c_pic;
    private  Timer timer;
    private List<Bitmap> pics = new ArrayList<>();
    int i;

    public MyView(Context context) {
        super(context);
        pic = BitmapFactory.decodeResource(getResources(), R.drawable.map1);
        pics.add(BitmapFactory.decodeResource(getResources(),R.drawable.c1));
        pics.add(BitmapFactory.decodeResource(getResources(),R.drawable.c2));
        pics.add(BitmapFactory.decodeResource(getResources(),R.drawable.c3));
        pics.add(BitmapFactory.decodeResource(getResources(),R.drawable.c4));
        pic_height = pic.getHeight();
        pic_width = pic.getWidth();
        timer = new Timer();
        TimerTask task = new TimerTask() {
            @Override
            public void run() {
                if (c_right < width) {
                    c_right += pic_width/40;
                    c_left += pic_width/40;
                }else{
                    c_left = 0;
                    c_right = width;
                }
                i++;
                if (i == 4){
                    i = 0;
                }
                c_pic = new Rect(c_left, c_top, c_right, c_bottom);
                postInvalidate();
            }
        };
        timer.schedule(task,2000,1000);
    }

    @Override
    protected void onSizeChanged(int w, int h, int oldw, int oldh) {
        width = w;
        height = h;
        c_top = 0;
        c_bottom = pic_height;
        c_right = pic_height * width / height;
        c_left = 0;
        need = new Rect(0, 0, width, height);
        super.onSizeChanged(w, h, oldw, oldh);
    }

    @Override
    protected void onDraw(Canvas canvas) {
        super.onDraw(canvas);
        Paint paint = new Paint();
        c_pic = new Rect(c_left, c_top, c_right, c_bottom);
        canvas.drawBitmap(pic, c_pic, need, paint);
        canvas.drawBitmap(pics.get(i),width*2/3,height*2/3,paint);
    }
}
