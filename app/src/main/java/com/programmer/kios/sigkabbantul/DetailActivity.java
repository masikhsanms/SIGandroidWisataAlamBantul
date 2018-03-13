package com.programmer.kios.sigkabbantul;

import android.content.Intent;
import android.support.v7.app.AppCompatActivity;
import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import com.android.volley.Request;
import com.android.volley.RequestQueue;
import com.android.volley.Response;
import com.android.volley.VolleyError;
import com.android.volley.toolbox.StringRequest;
import com.android.volley.toolbox.Volley;
import com.bumptech.glide.Glide;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import java.util.ArrayList;
import java.util.HashMap;

public class DetailActivity extends AppCompatActivity {

    String latt, longi, title;

    private ImageView imgWisata;
    private TextView tv_nama, tv_deskripsi;

    private RequestQueue requestQueue;
    private StringRequest stringRequest;

//    ArrayList<HashMap<String, String>> list_data;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_detail);

        Intent intent = getIntent();
        latt = intent.getStringExtra("latt");
        longi = intent.getStringExtra("longi");
        title = intent.getStringExtra("nama");

        String url = "http://192.168.43.158/android/marker_google_map_api/get_wisata.php";

        imgWisata = (ImageView)findViewById(R.id.img_wisata);
        tv_nama = (TextView)findViewById(R.id.tvNama);
        tv_deskripsi = (TextView)findViewById(R.id.tvDeskripsi);

//        requestQueue = Volley.newRequestQueue(DetailActivity.this);
//
//        list_data = new ArrayList<HashMap<String, String>>();
//
//        stringRequest = new StringRequest(Request.Method.GET, url, new Response.Listener<String>() {
//            @Override
//            public void onResponse(String response) {
//                try {
//                    JSONObject jsonObject = new JSONObject(response);
//                    JSONArray jsonArray = jsonObject.getJSONArray("wisata");
//                    for (int a = 0; a < jsonArray.length(); a++) {
//                        JSONObject jsObj = jsonArray.getJSONObject(a);
//                        HashMap<String, String> map = new HashMap<String, String>();
//                        map.put("nama", jsObj.getString("nama"));
//                        map.put("ket", jsObj.getString("keterangan"));
//                        map.put("gambar", jsObj.getString("gambar"));
//                        list_data.add(map);
//                    }
//                    Glide.with(getApplicationContext())
//                            .load("http://localhost/android/marker_google_map_api/img/" + list_data.get(0).get("gambar"))
//                            .crossFade()
//                            .placeholder(R.mipmap.ic_launcher)
//                            .into(imgWisata);
                    tv_nama.setText(title);
                    tv_deskripsi.setText(longi);
//                } catch (JSONException e) {
//                    e.printStackTrace();
//                }
//            }
//        }, new Response.ErrorListener() {
//            @Override
//            public void onErrorResponse(VolleyError error) {
//                Toast.makeText(DetailActivity.this, error.getMessage(), Toast.LENGTH_SHORT).show();
//            }
//        });
//
//        requestQueue.add(stringRequest);
    }
}
